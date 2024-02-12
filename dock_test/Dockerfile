FROM debian:buster

#Installation de mariaDB
RUN apt update -y && apt upgrade -y
RUN apt-get install -y nginx

#Creation du repertoire de travail
RUN mkdir -p /run/nginx



#Port de connexion


ENTRYPOINT [ "bash"]