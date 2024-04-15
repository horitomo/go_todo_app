.PHONY: help build build-local up down logs ps test
.DEFAULT_GOAL := help

DOCKER_TAG := latest

build:	## Build docker image to deploy
	docker build -t horitomo/gotodo:${DOCKER_TAG} \
		--target deploy ./

build-local:	## Build docker image to local development
	docker compose build --no-cache

up:	## Do docker compose up with ho reload
	docker compose up -d

down: ## Do docker compose down
	docker compose down

logs: ## Tail docker compose logs
	docker compose logs -f

ps: ## docker compose status check
	docker compose ps

test: ## execute tests
	go test -race -shuffle=on ./...

migrate: ## execute migrate
	mysqldef -u todo -p todo -h 127.0.0.1 -P 33306 todo < ./_tools/mysql/schema.sql

dry-migrate: ## dry run migrate
	mysqldef -u todo -p todo -h 127.0.0.1 -P 33306 todo < ./_tools/mysql/schema.sql

help: ## Show options
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

