#!bin/bash
while ! mariadb -h mariadb -u$SQL_USER -p$SQL_PASSWORD $SQL_DATABASE; do
    >&2 echo "Database is unavailable - sleeping"
    sleep 1
done


if [ ! -f wp-config.php ]; then
    wp core download    --allow-root
    wp config create	--allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD \
    					--dbhost=mariadb:3306 #--path='path/to/wordpress'

wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root #--path='path/to/wordpress'
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS #--path='path/to/wordpress' >> /log.txt
fi

# echo "define( 'CONCATENATE_SCRIPTS', false );" >> /var/www/wordpress/wp-config.php
# echo "define( 'SCRIPT_DEBUG', true );" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_HOME', 'https://lmaujean.42.fr' );" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_SITEURL', 'https://lmaujean.42.fr' );" >> /var/www/wordpress/wp-config.php

# echo "define( 'WP_DEBUG', true);" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_DEBUG_LOG', true);" >> /var/www/wordpress/wp-config.php
# echo "define( 'WP_DEBUG_DISPLAY', false);" >> /var/www/wordpress/wp-config.php
# echo "define('WP_ALLOW_REPAIR', true);" >> /var/www/wordpress/wp-config.php

	

# if /run/php folder does not exist, create it
#if [ ! -d /run/php ]; then
#    mkdir ./run/php
#fi
/usr/sbin/php-fpm7.3 -F