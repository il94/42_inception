sleep 10

if ! test -f "/var/www/wordpress/wp-config.php"; then
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
	wp core install		--allow-root \
						--url=http://ilandols.42.fr \
						--title="Mon Site" \
						--admin_user=Add_mine \
						--admin_password=azerty \
						--admin_email=admin@example.com

	wp user create		--allow-root \
						ilandols \
						ilyes@mail.fr \
						--user_pass=azerty \
						--display_name="Ilyes Landolsi"

fi