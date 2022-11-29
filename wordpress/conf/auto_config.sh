if [ ! -f wp-config.php ]; then
    wp core download    --allow-root
    wp config create	--allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD \
    					--dbhost=mariadb:3306 #--path='path/to/wordpress'

wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root #--path='path/to/wordpress'
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS #--path='path/to/wordpress' >> /log.txt
fi
	
chown -R www-data:www-data /var/www/html

/usr/sbin/php-fpm7.3 -F