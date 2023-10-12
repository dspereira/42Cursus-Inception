FROM debian:11

RUN apt-get update\
    && apt-get install -y nginx openssl\
    && mkdir -p /var/www/ /etc/nginx/ssl/

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/dsilveri.crt \
       -keyout /etc/nginx/ssl/dsilveri.key \
       -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42Lisboa/OU=dsilveri/CN=dsilveri/"

COPY nginx_config.conf /etc/nginx/conf.d
COPY index.html /var/www

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
