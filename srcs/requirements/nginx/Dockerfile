FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y nginx
RUN apt-get install -y openssl

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN chmod -R 644 /etc/nginx/conf.d/nginx.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/ssl_certif.crt -keyout /etc/nginx/ssl/ssl_key.key -subj "/C=FR/ST=IDF/L=Paris/O=School/OU=42Paris/CN=wdebotte.42.fr"

RUN mkdir -p /var/www/html
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY tools/nginx_init.sh /etc/nginx_init.sh
RUN chmod +x /etc/nginx_init.sh

EXPOSE 443

ENTRYPOINT [ "/etc/nginx_init.sh" ]