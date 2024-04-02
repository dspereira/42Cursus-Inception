FROM debian:11

RUN apt-get update\
    && apt-get install -y nginx openssl\
    && mkdir -p /var/www/ /etc/nginx/ssl/

# Nginx needs this directory to store important information about communication sockets for FastCGI
RUN mkdir -p /run/nginx

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/O=inception/OU=inception/CN=inception/"

COPY ./conf/nginx_config.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
