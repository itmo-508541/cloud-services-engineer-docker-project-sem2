.DEFAULT_GOAL := up

.PHONY: down up

down:
	docker compose down -v --rmi local

up:
	docker compose up -d --build
