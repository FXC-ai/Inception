echo "------------------------------- WORDPRESS START -----------------------------------"

php-fpm7.3 -v

echo "on attends les 20 s\n"
sleep 20

mariadb -u $MARIADB_USER --password=$MARIADB_PASS -P 3306 $MARIADB_DB_NAME -e "SHOW TABLES;"

if [ -e /var/www/wordpress/wp-config.php ]
then echo "wp-config existe."
else
	echo "\n"
	cd /var/www/wordpress
#	wp core download --allow-root
	
	wp config create --dbname=${MARIADB_DB_NAME} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_DB_PASS} --dbhost=${WP_HOST} --allow-root
#	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASS --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
	echo "\n"
fi

php-fpm7.3 -F