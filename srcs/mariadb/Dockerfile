FROM debian:11

RUN apt update \
   && apt install -y mariadb-server \
   && apt install -y mariadb-client

COPY mariadb_configs.sh /home

RUN mysql_install_db

RUN chmod +x /home/mariadb_configs.sh

EXPOSE 3306

#ENTRYPOINT ["/home/mariadb_configs.sh"]

#ENTRYPOINT /bin/bash "/home/mariadb_configs.sh"

#RUN /bin/bash "/home/mariadb_configs.sh"

ENTRYPOINT ["/bin/bash", "/home/mariadb_configs.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]

#ENTRYPOINT ["tail", "-f", "/dev/null"]

#ENTRYPOINT /bin/bash "/home/mariadb_configs.sh"

#CMD ["mariadbd"]

#CMD ["/bin/bash"]
