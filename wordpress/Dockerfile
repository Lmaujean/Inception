FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install wget -y

RUN apt-get install -y php7.3\
            php-fpm\
            php-mysql\
            mariadb-client

#RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /path/to
#RUN cd /path/to && tar -xzf wordpress-6.0.tar.gz

#RUN rm /path/to/wordpress-6.0.tar.gz

COPY ./conf/php.conf    /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/auto_config.sh /entrypoint.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mkdir -p /var/www/html
#RUN	chown -R root:root /path/to/wordpress


RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#COPY conf/auto_config.sh /path/to/wordpress/auto_config.sh
RUN	chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html


CMD ["bash", "/entrypoint.sh"]
#CMD tail -f