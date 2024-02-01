FROM debian:buster

#Installation de mariaDB
RUN apt update -y && apt upgrade -y
RUN apt-get install -y mariadb-server

#Creation du repertoire de travail
RUN mkdir -p /run/mysqld /var/lib/mysql

#Copie des fichiers de configuration et du script de démarrage
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/start_mdb.sh /usr/local/start_mdb.sh
RUN chmod +x /usr/local/start_mdb.sh

#Port de connexion
EXPOSE 3306

ENTRYPOINT [ "sh", "/usr/local/start_mdb.sh" ]


