#!/bin/sh

# if [ ! -d "/var/lib/mysql/mysql" ]; then
# 	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
# 	chown -R mysql:mysql /var/lib/mysql
# fi

if [ ! -d "/var/lib/mysql/wordpress" ]; then

	cat << EOF > /tmp/querys_database.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE user='';
DELETE FROM mysql.user WHERE user='root' AND host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS '${SQL_DATABASE}' CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS '${SQL_USERNAME}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON '${SQL_DATABASE}'.* TO '${SQL_USERNAME}'@'%';
FLUSH PRIVILEGES;
EOF

	chmod 777 /tmp/querys_database.sql
	mysqld --user=mysql --verbose --bootstrap < /tmp/querys_database.sql
	rm -f /tmp/querys_database.sql

fi

exec mysqld