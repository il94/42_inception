FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /tools/mariadb_init.sh /etc/mysql/mariadb_init.sh
RUN mkdir /run/mysqld && chown -R mysql:root /run/mysqld

RUN chmod +x /etc/mysql/mariadb_init.sh

EXPOSE 3306

ENTRYPOINT [ "/etc/mysql/mariadb_init.sh" ]