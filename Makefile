all:
	docker compose -f srcs/docker-compose.yml up -d

start:
	docker compose -f srcs/docker-compose.yml up -d

stop:
	docker compose -f srcs/docker-compose.yml stop

# Remove containers, imagens, e volumes, network
clean:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes

.SILENT:
clean-data:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes
	cd /home/dsilveri/data/ && rm -rf mysql wordpress && mkdir mysql  wordpress
	echo "\e[91mAll data stored in host volumes was be clean\e[0m"