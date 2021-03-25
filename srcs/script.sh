#!/bin/bash

./autoindex.sh off

rm /etc/nginx/sites-available/default
rm -rf /var/www/html/
cp default /etc/nginx/sites-available/

mkdir /var/www/localhost/
cp -r wordpress /var/www/localhost/
cp -r phpMyAdmin /var/www/localhost/

wget https://github.com/FiloSottile/mkcert/releases/download/v1.2.0/mkcert-v1.2.0-linux-amd64 
mv mkcert-v1.2.0-linux-amd64 cert
chmod +x cert
./cert -install
./cert localhost

service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'wordpress'@'localhost';" | mysql -u root
echo "SET password FOR 'wordpress'@'localhost' = password('password');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "quit"

service nginx start
service php7.3-fpm start
