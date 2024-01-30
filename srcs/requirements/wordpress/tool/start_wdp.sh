echo "------------------------------- WORDPRESS START -----------------------------------"

php-fpm7.3 -v


if [ -e /var/www/wordpress/wp-config.php]
then echo "wp-config existe."
else echo "wp-config existe pas."
fi


php-fpm7.3 -F

