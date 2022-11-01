.PHONY: help
.DEFAULT_GOAL := help
##############################
# make docker environmental
##############################
up:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

down-rmi:
	docker-compose down --rmi all
ps:
	docker-compose ps

dev:
	sh ./scripts/dev.sh

locust-dev:
	sh ./scripts/locust-dev.sh

locust-ps:
	docker-compose -f ./docker-compose.locust.yml ps

##############################
# etc
##############################
help:
	@cat Makefile
