sleep 10

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	wp --path='/var/www/wordpress' config create \
						--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306
						
	# wp --path='/var/www/wordpress' core install \
	# 					--allow-root \
	# 					--url=http://ilandols.42.fr \
	# 					--title="Mon Site" \
	# 					--admin_user=Add_mine \
	# 					--admin_password=azerty \
	# 					--admin_email=admin@example.com

	# wp --path='/var/www/wordpress' user create
	# 					--allow-root \
	# 					ilandols \
	# 					ilyes@mail.fr \
	# 					--user_pass=azerty \
	# 					--display_name="Ilyes Landolsi"
else
	echo "CA EXISTE"
fi

/usr/sbin/php-fpm7.3 -F