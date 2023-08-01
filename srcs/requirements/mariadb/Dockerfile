FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb_init.sh /etc/mysql/mariadb_init.sh
RUN chmod +x /etc/mysql/mariadb_init.sh

RUN mkdir /run/mysqld
RUN chown -R mysql:root /run/mysqld

EXPOSE 3306

ENTRYPOINT [ "/etc/mysql/mariadb_init.sh" ]