#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

    /etc/init.d/mariadb start

    sleep 1

    mysql -u root -e "CREATE DATABASE $DB_NAME;"
    mysql -u root -e "CREATE USER '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_PASS';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    /etc/init.d/mariadb stop

else
    echo "Database is already configured"

fi

exec "$@"
