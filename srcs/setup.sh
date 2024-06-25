#!/bin/bash

service mysql start
mysql -uroot < /etc/mysql.txt

rm -rf /var/www/html/index.nginx-debian.html

rm -rf /etc/nginx/sites-available/default
mv etc/default etc/nginx/sites-available/.

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx-selfsigned.key -out /etc/nginx/nginx-selfsigned.crt < /etc/openssl_script &> /dev/null
chown -R www-data:www-data /var/www/html

service php7.3-fpm start
service nginx start

bash
