FROM debian:buster

# Installation et mise à jour des paquets
RUN apt update -y && apt upgrade -y

# Installation de wget programme permettant le téléchargement de fichiers depuis le Web
RUN apt-get install -y wget

# Installation de php7.3 et de php-fpm pour gérer les requête ".php"
# Installation de mysql et de mariadb-client pour gérer les requête ".sql"
RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client

# Création du dossier de worpress et du dossier de travail php
RUN	mkdir -p /var/www/wordpress
RUN mkdir -p /run/php

# Assignation des droits a l'utilisateur www-data
RUN chown -R www-data:www-data /var/www

# Changement de permission sur les dossiers et fichiers
RUN chmod -R 755 /var/www

# Copie de la configuration de php-fpm et du script de démarrage
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tool/start_wdp.sh /usr/local/start_wdp.sh
RUN chmod +x /usr/local/start_wdp.sh

# Exposition du port 9000
EXPOSE 9000

ENTRYPOINT ["sh", "/usr/local/start_wdp.sh"]