
#!/bin/bash


if [ ! -d "/var/lib/mysql/my_db" ]; then
    echo "##############################################"

    /etc/init.d/mariadb start

    mysql -u root -e "CREATE DATABASE my_db;"
    mysql -u root -e "CREATE USER 'dsilveri'@'%' IDENTIFIED BY '123';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *. * TO 'dsilveri'@'%';"
    mysql -u root -e FLUSH PRIVILEGES;

    /etc/init.d/mariadb stop

fi


exec "$@"




#/etc/init.d/mariadb start

#mysql -u root -e "GRANT ALL ON *.* TO 'dsilveri'@''%' IDENTIFIED BY '123' WITH GRANTS OPTION";

#mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'dsilveri'@'%' IDENTIFIED BY '123' WITH GRANT OPTION"; 
#mysql -u root -e "FLUSH PRIVILEGES";

#"CREATE USER 'dsilveri'@'"$WP_CONT_NAME.$NETWORK_NAME"' IDENTIFIED BY '"$DB_PASSWORD"';

#CMD ["mysqld", "--bind-address=0.0.0.0"]


#mysql -u root 

#funciona para alterar a pass do root
#ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
#FLUSH PRIVILEGES;


#CREATE USER 'dsilveri'@'localhost' IDENTIFIED BY '123'; GRANT ALL PRIVILEGES ON *. * TO 'dsilveri'@'localhost'; FLUSH PRIVILEGES;

#CREATE USER 'test'@'dsilveri.42.fr' IDENTIFIED BY '1234'; GRANT ALL PRIVILEGES ON *. * TO 'dsilveri'@'localhost'; FLUSH PRIVILEGES;

#CREATE USER 'aaa' IDENTIFIED BY '1234'; GRANT ALL PRIVILEGES ON *. * TO 'dsilveri'@'localhost'; FLUSH PRIVILEGES;

#CREATE USER 'bbb'@'%' IDENTIFIED BY '1234'; GRANT ALL PRIVILEGES ON *. * TO 'dsilveri'@'localhost'; FLUSH PRIVILEGES;

#CREATE USER 'ccc'@'%' IDENTIFIED BY '1234'; GRANT ALL PRIVILEGES ON *. * TO 'ccc'@'%'; FLUSH PRIVILEGES;


#/etc/init.d/mariadb stop

#exec "$@"