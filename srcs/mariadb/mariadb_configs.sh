
#!/bin/bash

if [ ! -d "/var/lib/mysql/my_db" ]; then

    /etc/init.d/mariadb start

    mysql -u root -e "CREATE DATABASE my_db;"
    mysql -u root -e "CREATE USER 'dsilveri'@'%' IDENTIFIED BY '123';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *. * TO 'dsilveri'@'%';"
    mysql -u root -e FLUSH PRIVILEGES;

    /etc/init.d/mariadb stop

fi

exec "$@"