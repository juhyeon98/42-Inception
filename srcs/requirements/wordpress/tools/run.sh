#!/bin/bash

# download wordpress command line(wp-cli)
cd /var/www/html;
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# set wp-cli
cd /var/www/html;
wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --dbprefix=$DB_PREFIX --allow-root
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_email=$WP_EMAIL --admin_password=$WP_PASSWORD --allow-root
wp theme install twentytwenty --activate --allow-root

# set socket
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf;

/usr/sbin/php-fpm7.4 -F;