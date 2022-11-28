FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /etc/ssl/certs

RUN openssl req -x509 \
            -nodes \
            -out /etc/ssl/certs/inception.crt \
            -keyout /etc/ssl/certs/inception.key \
            -subj "/C=FR/ST=IDF/L=Nice/O=42nice/OU=lmaujean/CN=lmaujean.42.fr/UID=lmaujean"
                
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;"]