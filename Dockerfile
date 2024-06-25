FROM debian:buster

RUN apt-get update
RUN apt-get install -y default-mysql-server nginx php php-fpm php-mysql openssl

COPY ./srcs/setup.sh /etc
COPY ./srcs/mysql.txt /etc
COPY ./srcs/default /etc
COPY ./srcs/openssl_script /etc
COPY ./srcs/wpphp /var/www/html

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["bash", "/etc/setup.sh"]
