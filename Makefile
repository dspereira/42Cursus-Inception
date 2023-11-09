HOST_USER	=  dsilveri

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

	docker compose -f srcs/docker-compose.yml up -d

start:
	docker compose -f srcs/docker-compose.yml up -d

stop:
	docker compose -f srcs/docker-compose.yml stop

down:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes

clean: down

clean-all-data: clean
	cd /home/$(HOST_USER)/data/ && rm -rf mysql wordpress

re: clean all


show-logs:
	docker compose -f srcs/docker-compose.yml logs

show-info:
	echo "-------------------------------------------------------------------------------------------------"
	cd srcs && sudo docker compose ps -a
	echo "-------------------------------------------------------------------------------------------------"
	docker images
	echo "-------------------------------------------------------------------------------------------------"
	docker network ls
	echo "-------------------------------------------------------------------------------------------------"
	docker volume ls
	echo "-------------------------------------------------------------------------------------------------"
