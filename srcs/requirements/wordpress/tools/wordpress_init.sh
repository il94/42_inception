#!/bin/sh

sleep 10

if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

if [ ! -f "wp-config-sample.php" ]; then
	wp core download --allow-root
fi

if [ ! -f "wp-config.php" ]; then
	wp config create	--path='/var/www/html' \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USERNAME \
						--dbpass=$SQL_PASSWORD \
						--dbhost=$SQL_HOST \
						--allow-root

	wp core install		--url=$WP_URL \
						--title=$WP_SITE_TITLE \
						--admin_user=$WP_ADMIN_USERNAME \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_EMAIL \
						--allow-root
fi

if [[ -z $(wp user get $WP_USERNAME --allow-root) ]]; then
	wp user create		$WP_USERNAME \
						$WP_EMAIL \
				   		--user_pass=$WP_PASSWORD \
				   		--allow-root
fi

/usr/sbin/php-fpm7.3 -F -R