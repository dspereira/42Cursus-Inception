#!/bin/bash

service mysql start
sleep 1

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

mysql_secure_installation << END

Y
teste42pass
teste42pass
Y
Y
Y
Y
END

    sleep 1
    mysql -u root -e "CREATE DATABASE $DB_NAME;"
    mysql -u root -e "CREATE USER '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_PASS';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'teste42pass';"
    mysql -u root -pteste42pass -e "FLUSH PRIVILEGES;"

else
    sleep 1
    echo "Database is already configured"
fi

mysqladmin -u root -pteste42pass shutdown

echo "Database is ready to use."

exec "$@"

