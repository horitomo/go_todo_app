package main

import (
	"context"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/horitomo/go_todo_app/config"
)

func TestNewMux(t *testing.T) {
	w := httptest.NewRecorder()
	r := httptest.NewRequest(http.MethodGet, "/health", nil)
	t.Setenv("TODO_DB_HOST", "127.0.0.1")
	t.Setenv("TODO_DB_PORT", "33306")
	t.Setenv("TODO_DB_USER", "todo")
	t.Setenv("TODO_DB_PASSWORD", "todo")
	t.Setenv("TODO_DB_NAME", "todo")

	ctx := context.Background()
	cfg, err := config.New()
	if err != nil {
		t.Fatalf("failed to config: %s", err)
	}

	mux, cleanup, err := NewMux(ctx, cfg)
	if err != nil {
		t.Fatalf("failed to mux: %s", err)
	}
	defer cleanup()
	mux.ServeHTTP(w, r)

	resp := w.Result()
	t.Cleanup(func() { _ = resp.Body.Close() })

	if resp.StatusCode != http.StatusOK {
		t.Error("want status code 200, but", resp.StatusCode)
	}

	got, err := io.ReadAll(resp.Body)
	if err != nil {
		t.Fatalf("failed to read body: %v", err)
	}

	want := `{"status": "ok"}`
	if string(got) != want {
		t.Errorf("want %s but %s", want, string(got))
	}
}
