FROM debian:11

RUN apt update \
   && apt install -y mariadb-server

COPY mariadb_configs.sh /home

RUN chmod +x /home/mariadb_configs.sh

RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "/home/mariadb_configs.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
