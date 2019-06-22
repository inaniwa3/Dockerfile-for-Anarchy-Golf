.PHONY: help
.DEFAULT_GOAL := help

SERVICE := caddy

# https://postd.cc/auto-documented-makefile/
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## docker-compose build
	@docker-compose build

run: ## docker-compose run --rm caddy
	@docker-compose run --rm ${SERVICE}
