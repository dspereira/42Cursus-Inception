HOST_USER	=  dsilveri

all:
	@cd /home/$(HOST_USER)/data/ && \
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

# Remove containers, imagens, e volumes, network
clean:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes

clean-all-data:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes
	cd /home/$(HOST_USER)/data/ && rm -rf mysql wordpress

.SILENT:

show-logs:
	docker compose -f srcs/docker-compose.yml logs

show-info:
	echo "-------------------------------------------------------------------------------------------------"
	docker ps
	echo "-------------------------------------------------------------------------------------------------"
	docker images
	echo "-------------------------------------------------------------------------------------------------"
	docker network ls
	echo "-------------------------------------------------------------------------------------------------"
	docker volume ls