FROM debian:buster

RUN apt update -y && apt upgrade -y


ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install mariadb-server mariadb-client -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/auto_config.sh /init.sh
RUN chmod +x /init.sh

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD
RUN ["bash", "-c", "/init.sh"]


EXPOSE 3306

CMD [ "mysqld" ]
