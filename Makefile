HOST_USER	= dsilveri

# Containers Names 
MARIADB		= mariadb-database
NGINX		= nginx-server
WORDPRESS	= wordpress-app

# Docker Compose 
COMPOSE		= sudo docker compose -f srcs/docker-compose.yml
DOCKER		= sudo docker

.SILENT:

all:
	@cd /home/$(HOST_USER)/ && \
	if [ ! -d data/ ]; then \
		mkdir data; \
	fi;


	@cd /home/$(HOST_USER)/data && \
	if [ ! -d mysql ]; then \
		mkdir mysql; \
	fi; \
	if [ ! -d wordpress ]; then \
		mkdir wordpress; \
	fi;

	$(COMPOSE) up -d

start:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

clean:
	$(COMPOSE) down --rmi all --volumes

clean-data: clean
	cd /home/$(HOST_USER)/data/ && sudo rm -rf mysql wordpress

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
