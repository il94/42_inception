FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y wget
RUN apt-get install -y php php-fpm php-mysql php-gd php-curl php-mbstring php-xml php-zip
RUN apt-get install -y mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/wordpress_init.sh /etc/wordpress_init.sh
RUN chmod +x /etc/wordpress_init.sh

WORKDIR /var/www/html
EXPOSE 9000

ENTRYPOINT [ "/etc/wordpress_init.sh" ]
