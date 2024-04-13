package config

import (
	"fmt"
	"testing"
)

func TestNew(t *testing.T) {
	mainPort := 3333
	t.Setenv("PORT", fmt.Sprint(mainPort))

	got, err := New()
	if err != nil {
		t.Fatalf("cannot create config: %v", err)
	}

	if got.Port != mainPort {
		t.Errorf("want %d but %d", mainPort, got.Port)
	}

	wantEnv := "dev"
	if got.Env != wantEnv {
		t.Errorf("want env %s but %s", wantEnv, got.Env)
	}
}
