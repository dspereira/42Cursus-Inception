# 42Cursus-Inception

This project is an integral part of the 42Lisboa curriculum and aims to set up a small infrastructure using Docker and Docker Compose.

For this project, we have created three services, NGINX, MariaDB, and Wordpress each in a separate container managed by Docker Compose. All the containers were built using custom Dockerfiles based on Debian:11.


## Infrastructure Architecture

<img src="https://github.com/dspereira/42Cursus-Inception/blob/main/docs/infrastructure-architecture.png" alt="example" width="400"/>

### The infrastructure consists of three containers:

- **DB**: This container runs a MariaDB database and exposes port 3306 within the Docker internal network to communicate with the WordPress container. Additionally, this container has a volume to store data on the host, ensuring that data persists even after the container is deleted.

## Requirements

This project was developed and tested on Debian Linux.

To run this project, you'll need the following tools installed on your system:

- Docker Engine: [Docker Installation Guide](https://docs.docker.com/engine/install/)
- make

## Usage

### Clone repo:
```shell
git clone https://github.com/dspereira/42Cursus-Inception.git inception && cd inception
```

### Setting Up Environment Variables:
Before running the project, create a .env file in the root directory and populate it with the required environment variables, following the .env.template as a guide.
```shell
touch .env
```

### Build:

```shell
make
```

### Testing the Website
To ensure everything is working correctly, you can test by opening the provided link with your chosen domain. Since you are using OpenSSL, your certificate is self-signed, which may trigger a privacy and security warning in your browser. In this case, you will need to bypass this message and proceed to access the website.

https://example.com


## Makefile Commands

### Setting Up and Managing Docker Compose

- `make all`: Creates necessary directories and starts Docker Compose services in detached mode.
- `make start`: Starts Docker Compose services in detached mode.
- `make stop`: Stops Docker Compose services.
- `make clean`: Stops and removes all containers, images, and volumes created by Docker Compose.
- `make clean-data`: Stops and removes all containers, images, and volumes created by Docker Compose, as well as deletes any associated data directories.
- `make re`: Performs a clean operation followed by starting Docker Compose services.
- `make logs`: Displays logs of Docker Compose services.
- `make info`: Displays information about Docker Compose services, Docker images, networks, and volumes.

### Interacting with Docker Containers

- `make mariadb-it`: Enters an interactive shell session in the MariaDB container.
- `make nginx-it`: Enters an interactive shell session in the NGINX container.
- `make wordpress-it`: Enters an interactive shell session in the WordPress container.


## Useful Resources
[Useful commands for Docker](https://github.com/dspereira/42Cursus-Inception/blob/main/docs/useful-commands.md).

## License
This project is licensed under the [MIT License](https://github.com/dspereira/42Cursus-Inception/blob/main/LICENSE).

## Contact
If you have any questions or comments about this project, please feel free to contact me at diogo.s.pereira@outlook.pt.
