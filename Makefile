.PHONY: help
.DEFAULT_GOAL := help

WOKER=1
LOCUST_FILE=./locust/locustfile.py
LOCUST_SAMPLE_FILE=./locust/samples/locustfileTest.py

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

create: # create locustfile.py
ifeq ("$(wildcard $(LOCUST_FILE))", "") # ファイルが無い場合
	cp $(LOCUST_SAMPLE_FILE) $(LOCUST_FILE)
else
	@echo file already exist.
endif

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
