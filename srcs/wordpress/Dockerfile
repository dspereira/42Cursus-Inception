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
RUN mkdir -p /var/www/html/             \
    && cd /var/www/html/                \
    && wp --allow-root core download

#CMD ["php-fpm7.4", "-F",]
ENTRYPOINT ["tail", "-f", "/dev/null"]