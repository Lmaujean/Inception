FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install wget -y

RUN apt-get install -y php7.3\
            php-fpm\
            php-mysql\
            mariadb-client


COPY ./conf/php.conf    /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/auto_config.sh /init.sh
RUN chmod +x /init.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mkdir -p /var/www/html


RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN	chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html
RUN mkdir -p /run/php

ENTRYPOINT ["bash", "-c", "/init.sh"]