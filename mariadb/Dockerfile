FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/auto_config.sh /entrypoint.sh
#RUN service mysql start
EXPOSE 3306
ENTRYPOINT ["/entrypoint.sh"]
CMD ["service", "mysql", "start"]
#CMD tail -f