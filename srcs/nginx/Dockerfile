FROM debian:11

RUN apt-get update && apt-get install -y nginx \
    && mkdir -p /var/www/

COPY nginx_config.conf /etc/nginx/conf.d
COPY index.html /var/www

CMD ["nginx", "-g", "daemon off;"]
