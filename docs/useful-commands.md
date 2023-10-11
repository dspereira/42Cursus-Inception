# Docker Useful Commands

Here are some useful Docker commands for managing your containers. Tested in Docker version 24.0.6

## Docker

### list all existing images
```shell
docker images
```
### remove images
```shell
docker images rm id-image
```
### list running containers
```shell
docker ps
```
### list the active networks
```shell
docker network ls
```
### verify configs and containers connected to network
```shell
sudo docker network inspect network-name
```
### remove network
```shell
sudo docker network rm network-name
```

### pull an image from Docker Hub and run a container in detached mode
```shell
docker run -d nginx
```
### execute bash inside container
```shell
docker exec -it id-container /bin/bash
```

### build a imagem from a Dockerfile
```shell
docker build -t name-image-and-version:1.0 path-for-dockerfile
```
### inspect ip of container 
```shell
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' id-container
```

## Docker Compose

### start Containers
```shell
docker compose -f docker-compose.yml up
```

### stop and Remove Containers
```shell
docker compose -f docker-compose.yml down
```

## Others

### service status
```shell
service nginx status
```
### start service
```shell
service nginx start
```
### stop service
```shell
service nginx stop
```