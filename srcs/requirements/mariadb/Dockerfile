FROM debian:11

RUN apt update \
   && apt install -y mariadb-server

COPY ./tools/mariadb_configs.sh /home

RUN chmod +x /home/mariadb_configs.sh

RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT ["/home/mariadb_configs.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
