FROM debian:11

RUN apt update && apt install -y \
    curl            \
    php-fpm         \
    php-mysql       \
    php-curl        \
    php-gd          \
    php-mbstring    \
    php-xml         \
    php-xmlrpc      \
    php-soap        \
    php-intl        \
    php-zip

# Install WordPress CLI (WP-CLI) for command-line WordPress management.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Create the /var/www/html/ directory and download WordPress inside it, 
# ensuring accessibility for NGINX.
RUN mkdir -p /var/www/html
RUN cd /var/www/html && wp --allow-root core download

# This directory is required for creating the php7.4-fpm.pid file
RUN mkdir /run/php/ && chmod 755 /run/php/

# Update the 'listen' configuration in www.conf to use a network socket (0.0.0.0:9000)
RUN sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

COPY wordpress_configs.sh /home
RUN chmod +x /home/wordpress_configs.sh

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "/home/wordpress_configs.sh"]

CMD ["php-fpm7.4", "-F", "-R"]
