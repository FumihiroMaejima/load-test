.PHONY: help
.DEFAULT_GOAL := help

WOKER=1
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

create:
	cp ./locust/samples/locustfileTest.py ./locust/locustfile.py

locust-dev:
#	 sh ./scripts/locust-dev.sh
	sh ./scripts/locust-dev.sh $(WOKER)

locust-ps:
	docker-compose -f ./docker-compose.locust.yml ps

##############################
# etc
##############################
help:
	@cat Makefile
