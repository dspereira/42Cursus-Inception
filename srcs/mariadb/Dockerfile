FROM debian:11

RUN apt update \
    && apt install -y mariadb-server

EXPOSE 3306
CMD ["mariadbd"]

