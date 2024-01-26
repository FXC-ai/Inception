FROM debian:buster

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld /var/lib/mysql

RUN mysqld --initialize --user=mysql --datadir=/var/lib/mysql;

RUN chown -R mysql:mysql /var/lib/mysql;
RUN chown -R mysql:mysql /run/mysqld;

# launch mysqld in background
RUN mysqld --user=mysql --datadir=/var/lib/mysql &
