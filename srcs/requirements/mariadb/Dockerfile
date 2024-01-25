FROM debian:buster

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld /var/lib/mysql

#COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start_mdb.sh /usr/local/start_mdb.sh

RUN chmod +x /usr/local/start_mdb.sh

EXPOSE 3306

#ENTRYPOINT [ "sh", "/usr/local/start_mdb.sh" ]


