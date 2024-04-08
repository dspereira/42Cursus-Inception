FROM debian:11

RUN apt update && apt install -y \
    curl               \
    php7.4             \
    php7.4-fpm         \
    php7.4-mysql       \
    php7.4-curl        \
    php7.4-gd          \
    php7.4-mbstring    \
    php7.4-xml         \
    php7.4-xmlrpc      \
    php7.4-soap        \
    php7.4-intl        \
    php7.4-zip

# Install WordPress CLI (WP-CLI) for command-line WordPress management.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


# This directory is required for creating the php7.4-fpm.pid file
RUN mkdir /run/php/ && chmod 755 /run/php/

# Update the 'listen' configuration in www.conf to use a network socket (0.0.0.0:9000)
RUN sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wp_install_config.sh /home
RUN chmod +x /home/wp_install_config.sh

EXPOSE 9000

ENTRYPOINT ["/home/wp_install_config.sh"]

CMD ["php-fpm7.4", "-F", "-R"]
