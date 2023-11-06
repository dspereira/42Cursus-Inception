# Docker Useful Commands

Here are some useful Docker commands for managing your containers. Tested in Docker version 24.0.6

## Docker

### list all existing images
```shell
docker images
```
### remove images
```shell
docker image rm id-image
```
### list running containers
```shell
docker ps -a
```
### remove stoped containers
```shell
docker rm
```
### create a network type bridge
```shell
docker network create network-name
```
### list the active networks
```shell
docker network ls
```
### verify configs and containers connected to network
```shell
docker network inspect network-name
```
### remove network
```shell
docker network rm network-name
```
### create volume
```shell
docker volume create volume-name
```
### list all existing volumes
```shell
docker volume ls
```
### pull an image from Docker Hub and run a container in detached mode
```shell
docker run -d nginx
```
### stop container
```shell
docker stop id-container
```
### remove container
```shell
docker rm id-container
```
### start container
```shell
docker start id-container
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
### list containers running
```shell
docker compose ps
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
