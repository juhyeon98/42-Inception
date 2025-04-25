#!/bin/bash

service mariadb start;

# set mysql directory
mkdir -p /run/mysqld;
chown -R mysql: /run/mysqld;

# create sql file to init
echo "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` ;" > init.sql;
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> init.sql;
echo "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%' ;" >> init.sql;
echo "FLUSH PRIVILEGES ;" >> init.sql;

mysql -u root < init.sql;

service mariadb stop;

mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin --user=mysql --pid-file=/run/mysqld/mysqld.pid --socket=/run/mysqld/mysqld.sock --bind-address=0.0.0.0;