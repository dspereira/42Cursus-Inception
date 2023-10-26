#!/bin/bash

conf_file="/var/www/html/wp-config.php"

max_attempts=3
attempt=1

if [ ! -e "$conf_file" ]; then

    #has to sleep because can't connect mariadb. seems with depends_on don't grants that wordpress will init after mariadb
    sleep 5
    
    cd /var/www/html/

    # Download WordPress inside /var/www/html/
    wp core download --allow-root

    #creation of wp-config.php
    wp config create                \
    --allow-root                    \
    --path=/var/www/html/           \
    --dbname=my_db                  \
    --dbuser=dsilveri               \
    --dbpass=123                    \
    --dbhost=mariadb                \


    wp core install    \
    --allow-root \
    --title="Inception" \
    --admin_user=dsilveri \
    --admin_password=123 \
    --admin_email=test@test.com \
    --url=dsilveri.42.fr

else
    echo "Wordpress already installed and ready to use"
fi

exec "$@"