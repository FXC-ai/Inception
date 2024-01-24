FROM debian:buster

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start_mdb.sh /usr/local/start_mdb.sh

ENTRYPOINT [ "sh", "/usr/local/start_mdb.sh" ]

