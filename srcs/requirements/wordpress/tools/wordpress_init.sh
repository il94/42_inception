#!/bin/bash

echo "Initializing Wordpress container ..."

if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

if [ ! -f "wp-config-sample.php" ]; then
	wp core download --allow-root
fi

if [ ! -f "wp-config.php" ]; then
	echo "Create wp-config.php ..."
	wp config create	--path='/var/www/html' \
						--dbname=wordpress \
						--dbuser=$SQL_USERNAME \
						--dbpass=$SQL_PASSWORD \
						--dbhost=$SQL_HOST\
						--allow-root

	echo "Installing Wordpress ..."
	wp core install	--url=$WP_URL \
					--title=$WP_SITE_TITLE \
					--admin_user=$WP_ADMIN_USERNAME \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--allow-root
fi

echo "Check if user $WP_USERNAME already exists ..."
if [[ -z $(wp user get $WP_USERNAME --allow-root) ]]; then
	echo "Creating new user ($WP_USERNAME) ..."
	wp user create	$WP_USERNAME \
					$WP_EMAIL \
					--user_pass=$WP_PASSWORD \
					--allow-root
fi

echo "Wordpress container is ready."
/usr/sbin/php-fpm7.3 -F -R
