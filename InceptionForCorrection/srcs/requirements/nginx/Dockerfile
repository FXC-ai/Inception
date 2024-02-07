FROM debian:buster

# Installation de nginx
RUN apt-get update -y 
RUN apt upgrade -y
RUN apt-get install -y nginx

# Installation de ssl et configuration du certificat
RUN mkdir -p /etc/nginx/ssl
RUN apt install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=SW/ST=VS/L=Lausane/O=42/OU=42/CN=fcoindre.42.ch/emailAddress=fcoindre@student.42.fr"

# Création des répertoires nécessaires et configuration des droits
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# Copie du fichier de configuration et du script de démarrage
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tool/start_ngx.sh /usr/local/start_ngx.sh
RUN chmod +x /usr/local/start_ngx.sh

# Exposition des ports 443 est le port requis pour le protocole SSL (https)
EXPOSE 443

ENTRYPOINT ["sh", "/usr/local/start_ngx.sh"]

