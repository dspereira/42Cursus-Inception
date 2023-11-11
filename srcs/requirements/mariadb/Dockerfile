FROM debian:buster

RUN apt update \
   && apt install -y mariadb-server systemd

COPY ./tools/mariadb_configs.sh /home

RUN chmod +x /home/mariadb_configs.sh

RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT ["/home/mariadb_configs.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
