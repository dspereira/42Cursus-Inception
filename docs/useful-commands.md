# Docker Useful Commands

Here are some useful Docker commands for managing your containers. Tested in Docker version 24.0.6

## Docker

### list all existing images
```shell
docker images
```
### list running containers
```shell
docker ps
```
### list the active networks
```shell
docker network ls
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

## Docker Compose

### start Containers
```shell
docker compose -f docker-compose.yml up
```

### stop and Remove Containers
```shell
docker compose -f docker-compose.yml down
```
