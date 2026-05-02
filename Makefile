.DEFAULT_GOAL := build

.PHONY: down build logs

down:
	docker compose down -v

build: down
	docker compose up -d --build

logs:
	docker compose logs
