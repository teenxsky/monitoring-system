COMPOSE = docker compose -f ./docker-compose.yaml \
		--env-file=./.env.local

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' \
	$(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build the Docker images for the production environment
	@$(COMPOSE) build

.PHONY: up
up: ## Start the production environment
	@$(COMPOSE) up -d

.PHONY: up-logs
up-logs: ## Start the production environment and display logs
	@$(COMPOSE) up

.PHONY: restart
restart: ## Restart the production environment
	@$(COMPOSE) restart

.PHONY: clean
clean: ## Clean up the production environment
	@$(COMPOSE) down --rmi all

.PHONY: clean-volumes
clean-volumes: ## Clean up the production environment volumes
	@$(COMPOSE) down -v
