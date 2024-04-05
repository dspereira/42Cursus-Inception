# Containers Names
MARIADB		= mariadb-database
NGINX		= nginx-server
WORDPRESS	= wordpress-app

# Docker Compose
COMPOSE		= sudo docker compose -f srcs/docker-compose.yml
DOCKER		= sudo docker

include srcs/.env

.SILENT:

all:
	sudo mkdir -p $(VOLUMES_PATH)/data/mysql $(VOLUMES_PATH)/data/wordpress
	$(COMPOSE) up -d

start:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

clean:
	$(COMPOSE) down --rmi all --volumes

clean-data: clean
	sudo rm -rf $(VOLUMES_PATH)/data

re: clean all

logs:
	$(COMPOSE) logs

info:
	echo "-------------------------------------------------------------------------------------------------"
	$(COMPOSE) ps -a
	echo "-------------------------------------------------------------------------------------------------"
	$(DOCKER) images
	echo "-------------------------------------------------------------------------------------------------"
	$(DOCKER) network ls
	echo "-------------------------------------------------------------------------------------------------"
	$(DOCKER) volume ls
	echo "-------------------------------------------------------------------------------------------------"

mariadb-it:
	$(DOCKER) exec -it $(MARIADB) /bin/bash

nginx-it:
	$(DOCKER) exec -it $(NGINX) /bin/bash

wordpress-it:
	$(DOCKER) exec -it $(WORDPRESS) /bin/bash
