FROM debian:buster

RUN apt update
RUN apt upgrade -y

RUN apt-get install mariadb-server -y

RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install zsh -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
CMD [ "zsh" ]