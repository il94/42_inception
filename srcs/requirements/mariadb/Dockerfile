FROM debian:buster

RUN apt update
RUN apt upgrade -y

RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install zsh -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
CMD [ "zsh" ]

RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /tools/script.sh /etc/mysql/dockerinit.sh
RUN chmod 777 /etc/mysql/dockerinit.sh

ENTRYPOINT [ "sh", "/etc/mysql/dockerinit.sh" ]