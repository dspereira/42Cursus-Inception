# 42Cursus-Inception

This project is an integral part of the 42Lisboa curriculum and aims to set up a small infrastructure using Docker and Docker Compose.

For this project, we have created three services, NGINX, MariaDB, and Wordpress each in a separate container managed by Docker Compose. All the containers were built using custom Dockerfiles based on Debian:11.

For more info see the [subject](https://github.com/dspereira/42Cursus-Inception/blob/main/docs/inception_subject.pdf).

## Table of Contents
- [Infrastructure Architecture](#infrastructure-architecture)
- [Requirements](#requirements)
- [Installation / Usage](#installation--usage)
- [Makefile Commands](#makefile-commands)
- [Useful Resources](#useful-resources)
- [License](#license)
- [Contact](#contact)

## Infrastructure Architecture

<img src="https://github.com/dspereira/42Cursus-Inception/blob/main/docs/infrastructure-architecture.png" alt="example" width="400"/>

### The infrastructure consists of three containers:

- **DB**: This container runs a MariaDB database and exposes port 3306 within the Docker internal network to communicate with the WordPress container. Additionally, this container has a volume to store data on the host, ensuring that data persists even after the container is deleted.

- **WordPress+PHP**: This container has WordPress and PHP 7.4 installed. Since WordPress requires a database to function properly, it is configured to communicate with MariaDB via port 3306. Additionally, in order for WordPress to communicate with NGINX, it exposes port 9000 and configures php-fpm (FastCGI Process Manager) to listen on that port. Additionally, this container has a volume to store data on the host.

- **NGINX**: This container runs an HTTP server powered by NGINX, responsible for serving all content and communicating with the outside world via port 443 (HTTPS) using a self-signed certificate generated by OpenSSL. FastCGI is configured to route all PHP requests to WordPress via port 9000. Therefore, the PHP-FPM configured in the WordPress container is responsible for executing all PHP scripts and generating responses for NGINX. Additionally, NGINX is configured with the same volume as WordPress to serve static content such as HTML, JS, CSS, images, etc. 

### Docker Network
A bridge network is created to encompass all containers, facilitating communication among them, and allowing NGINX to communicate with the host. The bridge network is chosen due to its ability to provide a dedicated network interface to the containers, allowing them to communicate with each other and with the host while providing isolation from external networks.

## Requirements

This project was developed and tested on Debian Linux.

To run this project, you'll need the following tools installed on your system:

- Docker Engine: [Docker Installation Guide](https://docs.docker.com/engine/install/)
- make

## Installation / Usage

### Clone repo:
```shell
git clone git@github.com:dspereira/42Cursus-Inception.git inception && cd inception
```

### Setting Up Environment Variables:
Before running the project, create a .env file in the root directory and populate it with the required environment variables, following the [.env.template](https://github.com/dspereira/42Cursus-Inception/blob/main/srcs/.env.template) as a guide.
```shell
touch srcs/.env
```

### Build:

```shell
make
```

### Usage:
After Docker is running without any issues, you can access your website via HTTPS, for example, at https://localhost. If you are using a domain within your local network, ensure that the /etc/hosts file is configured correctly to access your website.

Since you are using OpenSSL, your certificate is self-signed, which may trigger a privacy and security warning in your browser. In this case, you will need to click on the option to accept and continue or a similar message, depending on the browser being used.

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
