echo "------------------------------- WORDPRESS START -----------------------------------"

php-fpm7.3 -v

# echo "on attends les 20 secondes pour etre sure que mariabd est bien lance\n"
# sleep 20

#mariadb -u $MARIADB_USER --password=$MARIADB_PASS -P 3306 $MARIADB_DB_NAME -e "SHOW DATABASES;"
while ! mariadb -u $MARIADB_USER --password=$MARIADB_PASS -h mariadb -P 3306 --silent; do
	sleep 1
	echo "mariadb n'est pas encore pret"
done

echo "ALORS VOILA LES DATABASES :"
mariadb -u $MARIADB_USER --password=$MARIADB_PASS -h mariadb -P 3306 -e "SHOW DATABASES;"

if [ -e /var/www/wordpress/wp-config.php ]
then echo "wp-config existe."
else
	
	chown -R www-data:www-data /var/www/*
	chmod -R 755 /var/www/*
	mkdir -p /var/www/wordpress

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp	

	cd /var/www/wordpress || exit
	wp core download --allow-root
	wp config create --dbname=$MARIADB_DB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASS --dbhost=$WP_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root

fi

php-fpm7.3 -F