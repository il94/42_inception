FROM debian:buster

RUN apt update
RUN apt upgrade -y

RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install zsh -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
CMD [ "zsh" ]

RUN apt install curl
RUN apt-get -y install wget

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /tmp
RUN mkdir /var/www
RUN tar -xzf /tmp/wordpress-6.0-fr_FR.tar.gz -C /var/www
RUN rm /tmp/wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client
COPY conf/php.ini /etc/php/7.3/cli/php.ini

RUN wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RUN tar -zxvf ioncube_loaders_lin_x86-64.tar.gz
RUN rm ioncube_loaders_lin_x86-64.tar.gz
RUN mv /ioncube/ioncube_loader_lin_7.3.so /usr/lib/php/20180731/ioncube_loaders_lin_7.3.so

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin
RUN chmod +x /usr/local/bin/wp-cli.phar
RUN mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh /etc/dockerinit.sh
RUN chmod 777 /etc/dockerinit.sh


RUN mkdir /run/php
# CMD [ "/usr/sbin/php-fpm7.3", "-F" ]

ENTRYPOINT [ "sh", "/etc/dockerinit.sh" ]