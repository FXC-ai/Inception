# INCEPTION

# Overview

## Subject abstract

Le schema montre parfaitement comment doit fonctionner l’application. La plus grande difficulté est de relier les containers entre eux via les ports.

D’abord le lien entre nginx et Worpress de fait via les fichiers de configuration. Le container Wordpress écoute sur le port 9000 et nginx redirige les reqûetes php vers le port 9000. Pour ce qui est de la connection entre le serveur Worpress et le Container mariadb, c’est un peu plus difficile car il faut que le Wordpress se connecte entant que client au serveur mysql. Pour cela il faut un utilisateur pour la DB et un mot de passe.

![Screen Shot 2024-01-02 at 5.12.09 PM.png](https://github.com/FXC-ai/Inception/blob/main/Screen%20Shot%202024-01-02%20at%205.12.09%20PM.png)

## Arborescence du projet

```bash
FX InceptionMyMac ls -alR
total 48
drwxr-xr-x  8 francois-xavier  staff   256 Feb  9 20:31 .
drwxr-xr-x  7 francois-xavier  staff   224 Feb  8 18:03 ..
-rw-r--r--  1 francois-xavier  staff    14 Feb  8 10:21 .gitignore
-rw-r--r--  1 francois-xavier  staff  1618 Feb  8 17:43 Makefile
drwxr-xr-x  6 francois-xavier  staff   192 Feb  8 18:50 srcs

./srcs:
total 32
drwxr-xr-x  6 francois-xavier  staff   192 Feb  8 18:50 .
drwxr-xr-x  8 francois-xavier  staff   256 Feb  9 20:31 ..
-rw-r--r--@ 1 francois-xavier  staff   320 Feb  9 20:31 .env
-rwxr-xr-x  1 francois-xavier  staff  1222 Feb  8 17:43 docker-compose.yml
drwxr-xr-x  5 francois-xavier  staff   160 Feb  8 10:21 requirements

./srcs/requirements:
total 0
drwxr-xr-x  5 francois-xavier  staff  160 Feb  8 10:21 .
drwxr-xr-x  6 francois-xavier  staff  192 Feb  8 18:50 ..
drwxr-xr-x  5 francois-xavier  staff  160 Feb  8 10:21 mariadb
drwxr-xr-x  6 francois-xavier  staff  192 Feb  8 18:04 nginx
drwxr-xr-x  6 francois-xavier  staff  192 Feb  8 18:03 wordpress

./srcs/requirements/mariadb:
total 8
drwxr-xr-x  5 francois-xavier  staff  160 Feb  8 10:21 .
drwxr-xr-x  5 francois-xavier  staff  160 Feb  8 10:21 ..
-rw-r--r--  1 francois-xavier  staff  498 Feb  8 10:21 Dockerfile
drwxr-xr-x  3 francois-xavier  staff   96 Feb  8 10:21 conf
drwxr-xr-x  3 francois-xavier  staff   96 Feb  8 10:21 tools

./srcs/requirements/mariadb/conf:
total 8
drwxr-xr-x  3 francois-xavier  staff   96 Feb  8 10:21 .
drwxr-xr-x  5 francois-xavier  staff  160 Feb  8 10:21 ..
-rw-r--r--  1 francois-xavier  staff  598 Feb  8 10:21 50-server.cnf

./srcs/requirements/mariadb/tools:
total 8
drwxr-xr-x  3 francois-xavier  staff    96 Feb  8 10:21 .
drwxr-xr-x  5 francois-xavier  staff   160 Feb  8 10:21 ..
-rw-r--r--  1 francois-xavier  staff  1362 Feb  8 10:21 start_mdb.sh

./srcs/requirements/nginx:
total 8
drwxr-xr-x  6 francois-xavier  staff  192 Feb  8 18:04 .
drwxr-xr-x  5 francois-xavier  staff  160 Feb  8 10:21 ..
-rw-r--r--  1 francois-xavier  staff    0 Feb  8 18:04 .dockerignore
-rw-r--r--  1 francois-xavier  staff  976 Feb  8 17:43 Dockerfile
drwxr-xr-x  3 francois-xavier  staff   96 Feb  8 10:21 conf
drwxr-xr-x  3 francois-xavier  staff   96 Feb  8 10:21 tool

./srcs/requirements/nginx/conf:
total 8
drwxr-xr-x  3 francois-xavier  staff    96 Feb  8 10:21 .
drwxr-xr-x  6 francois-xavier  staff   192 Feb  8 18:04 ..
-rw-r--r--  1 francois-xavier  staff  1733 Feb  8 10:21 nginx.conf

./srcs/requirements/nginx/tool:
total 8
drwxr-xr-x  3 francois-xavier  staff   96 Feb  8 10:21 .
drwxr-xr-x  6 francois-xavier  staff  192 Feb  8 18:04 ..
-rw-r--r--  1 francois-xavier  staff  126 Feb  8 10:21 start_ngx.sh

./srcs/requirements/wordpress:
total 8
drwxr-xr-x  6 francois-xavier  staff   192 Feb  8 18:03 .
drwxr-xr-x  5 francois-xavier  staff   160 Feb  8 10:21 ..
-rw-r--r--  1 francois-xavier  staff     0 Feb  8 18:03 .dockerignore
-rw-r--r--  1 francois-xavier  staff  1010 Feb  8 10:21 Dockerfile
drwxr-xr-x  4 francois-xavier  staff   128 Feb  8 10:21 conf
drwxr-xr-x  3 francois-xavier  staff    96 Feb  8 10:21 tool

./srcs/requirements/wordpress/conf:
total 48
drwxr-xr-x  4 francois-xavier  staff    128 Feb  8 10:21 .
drwxr-xr-x  6 francois-xavier  staff    192 Feb  8 18:03 ..
-rw-r--r--  1 francois-xavier  staff    218 Feb  8 10:21 www.conf

./srcs/requirements/wordpress/tool:
total 8
drwxr-xr-x  3 francois-xavier  staff    96 Feb  8 10:21 .
drwxr-xr-x  6 francois-xavier  staff   192 Feb  8 18:03 ..
-rw-r--r--  1 francois-xavier  staff  1425 Feb  8 10:21 start_wdp.sh
```

## Docker

[Docker Compose Tutorial: advanced Docker made simple](https://www.educative.io/blog/docker-compose-tutorial)

Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production. Docker provides the ability to package and run an application in a loosely isolated environment called a container.

## Docker compose

This is a tool for defining and running **multi-container** Docker applications. With Compose, you use a **YAML file** to configure your application’s services, networks, and volumes. Then, with a single command, you create and start all the services from your configuration.

## Dockerfiles

A Dockerfile is a script containing a series of instructions and commands used to build a Docker image. It automates the process of creating Docker images.

## Docker images

A Docker image is a lightweight, standalone, and executable software package that includes everything needed to run a container. It's essentially a snapshot of a container, including the application and its dependencies. Images serve as the basis for containers.

## Docker-network

For Docker containers to communicate with each other and the outside world via the host machine, there has to be a layer of networking involved. Docker supports different types of networks, each fit for certain use cases.

For example, building an application which runs on a single Docker container will have a different network setup as compared to a web application with a cluster with database, application and load balancers which span multiple containers that need to communicate with each other. Additionally, clients from the outside world will need to access the web application container.

## Volume

In Docker, a volume is a mechanism for persisting data generated by and used by Docker containers. Unlike the ephemeral nature of containers, which are designed to be stateless and immutable, volumes provide a way to store and manage data permanently, independent of the container lifecycle.

## Stateless / Statefull

A stateless process or application, however, does not retain information about the user's previous interactions. There is no stored knowledge of or reference to past transactions. Each transaction is made as if from scratch for the first time. Stateless applications provide one service or function and use a content delivery network (CDN), web, or print servers to process these short-term requests.

# Friendly reminder about debian

Il y a un systeme de user / owner / permission sur l’ensemble des fichier de l’OS :

- Pour voir la liste des users existants : `cut -d: -f1 /etc/passwd`
- Pour voir la liste des groupes existants : `cut -d: -f1 /etc/group`
- Pour modifier le propriétaire d’un fichier (change owner) : `chown -R NEW_USER_NAME:NEW_GROUP_NAME FILE_PATH`

# Docker command

| docker ps (-a) | show the names of all the containers you have + the id you need and the port associated. The “-a” flag allows the command to show every processus even ended processus. |
| --- | --- |
| docker pull "NameOfTheImage" | pull an image from dockerhub |
| docker run "name of the docker image" | to run the docker image |
| docker image ls / docker images / docker image list | displays avaible images |
| docker run -it IMAGE_NAME | run the image and launch an interactive terminal |
| docker run —name CONTAINER_NAME IMAGE NAME | the name of the docker won’t be random anymore |
| docker exec -ti ID_RETOURNÉ_LORS_DU_DOCKER_RUN bash | run a bash in the docker |
| docker rm ID_RETOURNÉ_LORS_DU_DOCKER_RUN | destruct the container and all what it contains |
| docker system prune | erase everything : images, containers, cache, network |
| docker run -d -p 8080:80 nginx | - d : for detach mode, that means an other processus is created to run the docker ans leave the console avaible

-p : for using ports. Here we are asking to redirect the traffic from 8080 to the port 80. As a consequence http://127.0.0.1:8080 will get you the default page of Nginx. |
| docker image rm [OPTIONS] IMAGE [IMAGE...] | erase the concerned image |
| docker stop ID_RETOURNÉ_LORS_DU_DOCKER_RUN | stop a running docker |
| docker build -t NOM_DE_L_IMAGE EMPLACEMENT_DE_L_IMAGE | pour build une image depuis un dockerfile |
| docker volume rm NOM_DU_VOLUME | supprimer un volume |
| docker build -t [NOM DE L IMAGE] [CHEMIN VERS DOCKERFILE] | Pour build une image à partir d’un dockerfile. Si l’argument -t n’est pas utilisé alors Docker se chargera de donner un nom générique à l’image |
| docker container inspect [container name] | Pour inspecter un container |

# Dockerfile

| ENV |  |
| --- | --- |
| WORDIR |  |
| USER |  |
| RUN | It is used to execute commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile. `RUN` is executed at build time, and its changes are saved in the image. |
| COPY | it copies a file inside the container from the host machine |
| CMD | It specifies what command to run when the container starts. CMD is executed at the run time. CMD can be overriden by passing command to docker run. |
| ENTRYPOINT | Do basically the same thing as RUN but It can not be overriden |

# Makefile et .env

## Makefile

```makefile
NAME = inception
PATH_DOCKER_COMPOSE = srcs/docker-compose.yml
PATH_V_WORDPRESS = /Users/francois-xavier/data/wordpress
PATH_V_MARIADB = /Users/francois-xavier/data/mariadb
PATH_TO_ENV_FILE = /Users/francois-xavier/Desktop/.private_env
RESET_COLOR = \033[0m

all : prepare down build run

run:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up

run-daemon:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up -d

down:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} down

stop:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} stop

prepare:
	if [ ! -d srcs/.env ]; then \
		cp ${PATH_TO_ENV_FILE} srcs/.env; \
	fi
	if [ ! -d ${PATH_V_WORDPRESS} ]; then \
		mkdir -p ${PATH_V_WORDPRESS}; \
	fi
	if [ ! -d ${PATH_V_MARIADB} ]; then \
		mkdir -p ${PATH_V_MARIADB}; \
	fi

build:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} build

clean: down
	docker system prune -a

fclean: down
	docker system prune -a --volumes
	docker volume rm $$(docker volume ls -q)
	rm -rf ~/data

re: fclean all

delete-volumes :
	docker system prune -a --volumes
	docker volume rm $$(docker volume ls -q)

status :

	@echo "\033[44mRunning Containers :${RESET_COLOR}"
	@docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} ps
	@echo ""

	@echo "\033[44mImages :${RESET_COLOR}"
	@docker images
	@echo ""

	@echo "\033[44mContainers :${RESET_COLOR}"
	@docker container ls -a
	@echo ""

	@echo "\033[44mVolumes :${RESET_COLOR}"
	@docker volume ls
	@echo ""

	@echo "\033[44mNetwork :${RESET_COLOR}"
	@docker network ls
	@echo ""

.PHONY: all clean fclean re status stop run run-daemon down build prepare delete-volumes
```

## .env

Le fichier .env contient toutes les variables qui seront ajoutées à l’environnement des containers. Le nom des variables et les valeurs sont à la discrétion de chacun.

```bash
MARIADB_ROOT_PASSWORD=mypass
MARIADB_DB_NAME=db_wordpress
MARIADB_USER=login
MARIADB_PASS=mypass

WP_TITLE=login42
WP_HOST=mariadb
WP_ADMIN_USER=login42
WP_ADMIN_PASSWORD=mypass
WP_ADMIN_EMAIL=login@student.42.fr

DOMAIN_NAME=localhost

WP_USER=student
WP_USER_PASS=password
WP_USER_EMAIL=student@student.42.fr
```

Il ne faut surtout pas hard coder ces variables dans le projet. Sinon c’est 0 !

# docker-compose

## Commandes docker-compose

Pour construire les images nécessaire de la stack  : `docker-compose build`

Pour lancer un container (en mode détaché) : `docker-compose up -d`

Pour arrêter une infrastructure et remove les containers : `docker-compose down`

## fichier .yml

```yaml
version: "3" #permet de spécifier la version du compose file choisis. Selon les versions la syntaxe et les caractéristiques peuvent changer.

volumes:
  mariadb_v:                               # Nom du volume
    driver: local                          # 
    name: mariadb_v
    driver_opts:
      device: **/home/login/data/mariadb/    # Emplacement du dossier binded sur la machine hôte**
      type: none
      o: bind
  wordpress_v:
    driver: local
    name: wordpress_v
    driver_opts:
      device: **/home/login/data/wordpress/**
      type: none
      o: bind

services:
  mariadb:
    container_name: mariadb                # Nom du container
    networks:                              # Choix du network auquel appartient ce service 
        - inception
    build:
        context: requirements/mariadb.     # Emplacement du Dockerfile
        dockerfile: Dockerfile             # Nom du fichier Dockerfile
    volumes:
        - mariadb_v:/var/lib/mysql         # Lien entre le volume en local et le volume dans le container
    restart: unless-stopped                # Politique de redémarage
    env_file: .env                         # Definition des variables de l'environement

  nginx:
    container_name: nginx
    volumes:
        - wordpress_v:/var/www/wordpress
    networks:
        - inception
    depends_on:
        - wordpress
    build:
        context: requirements/nginx
        dockerfile: Dockerfile
    ports:                                 # Exposition du port vers l'extêrieur du network
        - "443:443"                        # pour rendre accéssible notre conteneur depuis l’exterieur. PORT_HOTE:PORT_CONTAINER
    restart: on-failure

  wordpress:
    container_name: wordpress
    volumes:
        - wordpress_v:/var/www/wordpress
    networks:
        - inception
    build:
        context: requirements/wordpress
        dockerfile: Dockerfile
    depends_on:
        - mariadb
    restart: on-failure
    env_file: .env

networks:                                  # Definition des networks
    inception:                             # Nom du network
        driver: bridge                     # type de network
```

Comme les containers sont interdépendant les uns des autres, ils doivent être démarrés dans un ordre précis. C’est ce que l’instruction depends_on permets.

1. mariadb
2. wordpress
3. nginx

ATTENTION !!! docker compose ne fait pas tous le travail. La directive depends_on permet effectivement de build et run les images dans le bon ordre. Par exemple l’image de wordpress ne sera run qu’après l’image de mariabd. Par “run”, j’entends que la dernière commande du Dockerfile est éxécutée (c’est à dire ENTRYPOINT). MAIS ! Rien ne garantit que mariadb aura terminé d’éxécuter son script de démarage au moment on l’on run l’image de wordpress ! Or si wordpress se lance alors que mariadb n’a pas terminé sa configuration cela risque de poser problème. Il est donc essentiel d’anticiper cela. Comment ? Eh bien nous le verrons par la suite.

## A propos des network de docker

Il existe différents types de réseaux utilisables par docker compose. Le sujet interdit formellement d’utiliser un réseau de type host car un tel réseau n’isole plus les containers de la machine hôte. Il faut donc utiliser un réseau de type bridge qui permet aux containers de communiquer entre eux mais qui empêche l’hôte d’accéder aux containers depuis l’extérieure. A titre d’information, voici les différents types de réseaux possibles pour un docker compose :

- bridge : les réseaux Bridge créent un pont logiciel entre votre hôte et le conteneur. Les conteneurs connectés au réseau peuvent communiquer entre eux, mais ils sont isolés de ceux qui se trouvent en dehors du réseau.
- host : les conteneurs qui utilisent le mode réseau hôte partagent la pile réseau de l’hôte sans aucune isolation. Aucune adresse IP propre ne leur est attribuée, et les liaisons de port sont publiées directement sur l'interface réseau de l’ hôte. Cela signifie qu'un processus de conteneur qui écoute sur le port 80 se liera à HOST_IP:80.
- overlay : permet de faire communiquer deux instances distinctes de Docker Engine.
- IPvLAN : est un pilote avancé qui offre un contrôle précis sur les adresses IPv4 et IPv6 assignées aux conteneurs. Ce type de réseau est utilisé pour faire communiqué des services conteneurisés à un réseau physique existant.
- macvlan : est une autre option avancée qui permet aux conteneurs d'apparaître comme des périphériques physiques sur le réseau. Chaque conteneur posséde une adresse MAC unique.

[Networking in Compose](https://docs.docker.com/compose/networking/)

[Docker Networking - Basics, Network Types & Examples](https://spacelift.io/blog/docker-networking)

[Docker Networking - Aqua](https://www.aquasec.com/cloud-native-academy/docker-container/docker-networking/)

A propos des Dockers networks

# Container pour Nginx

Voici la commande sui permet de tester le container nginx  : `docker run -d -p 443:443 CONTAINER_NAME`

## A propos du port 443 et du protocole SSL/TLS

Nginx est le seul container autorisé à communiquer avec l’extérieure du network par le port 443.
Le port 443 est le port réservé au protocole https. Le protocole https est une surcouche au protocole http. Il utilise une clé privé et une clé publique pour communiquer de façon sécurisé avec le client. Afin de pouvoir utiliser ce protocole https, il faut installer opennssl qui se charge de créer un certificat et une clé de chiffrement. Ce certificat sera auto-signé, par conséquent le navigateur demandera à l’utilisateur si il veut poursuivre ou “revenir en lieu sure” car un certificat auto-signé n’est pas un gage de sécurité. Le handshake entre le navigateur et le serveur n’est donc pas permis avec un certificat auto-signé. Mais la correction n’impose pas que le handshake entre le client et le serveur fonctionne.

[Qu'est-ce qu'un certificat SSL ? – Les certificats SSL/TLS expliqués – AWS](https://aws.amazon.com/fr/what-is/ssl-certificate/)

## Fichier de configuration de nginx

### Fichier par défaut

Le fichier par défaut de nginx est le suivant (sans les parties commentées) :

```bash
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
	worker_connections 768;
}

http {

	sendfile on;
	tcp_nopush on;
	tcp_nodelay on;
	keepalive_timeout 65;
	types_hash_max_size 2048;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # Dropping SSLv3, ref: POODLE
	ssl_prefer_server_ciphers on;

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	gzip on;

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
}

```

http {} : bloc de configuration du serveur HTTP. Ce bloc contient les settings spécifiques sur comment le serveur http doit gérer les requêtes http(s). A titre d’information, on y retrouve le type MIME par défaut, les protocoles TLS acceptés ou encore l’emplacement du fichier de log du serveur http. Au sein de ce bloc http sont inclus tous les fichiers contenus dans le dossier `sites-enabled`. Ce dossier contient un fichier `default` que voici :

```bash
##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# https://www.nginx.com/resources/wiki/start/
# https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/
# https://wiki.debian.org/Nginx/DirectoryStructure
#
# In most cases, administrators will remove this file from sites-enabled/ and
# leave it as reference inside of sites-available where it will continue to be
# updated by the nginx packaging team.
#
# This file will automatically load configuration files provided by other
# applications, such as Drupal or Wordpress. These applications will be made
# available underneath a path with that package name, such as /drupal8.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

# Default server configuration
#
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	# SSL configuration
	#
	# listen 443 ssl default_server;
	# listen [::]:443 ssl default_server;
	#
	# Note: You should disable gzip for SSL traffic.
	# See: https://bugs.debian.org/773332
	#
	# Read up on ssl_ciphers to ensure a secure configuration.
	# See: https://bugs.debian.org/765782
	#
	# Self signed certs generated by the ssl-cert package
	# Don't use them in a production server!
	#
	# include snippets/snakeoil.conf;

	root /var/www/html;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

	# pass PHP scripts to FastCGI server
	#
	#location ~ \.php$ {
	#	include snippets/fastcgi-php.conf;
	#
	#	# With php-fpm (or other unix sockets):
	#	fastcgi_pass unix:/run/php/php7.3-fpm.sock;
	#	# With php-cgi (or other tcp sockets):
	#	fastcgi_pass 127.0.0.1:9000;
	#}

	# deny access to .htaccess files, if Apache's document root
	# concurs with nginx's one
	#
	#location ~ /\.ht {
	#	deny all;
	#}
}

# Virtual Host configuration for example.com
#
# You can move that to a different file under sites-available/ and symlink that
# to sites-enabled/ to enable it.
#
#server {
#	listen 80;
#	listen [::]:80;
#
#	server_name example.com;
#
#	root /var/www/example.com;
#	index index.html;
#
#	location / {
#		try_files $uri $uri/ =404;
#	}
#}
```

Ce fichier est presque un tutoriel pas à pas, sur comment configurer notre serveur pour qu’il puisse servir notre site wordpress. Nous allons donc le suivre pour permettre le fonctionnement de notre site wordpress.

### Fichier pour le projet

Tout d’abord, avant d’ajouter le bloc server, nous pouvons remarquer que les protocoles TLS utilisés par défaut ne sont pas ceux imposés par le sujet. Il faut modifier cette ligne et mettre `TLSv1.2 et TLSv1.3` en remplacement. C’est l’unique modification que nous feront à la configuration de base de nginx. Ensuite il faut ajouter un bloc `serveur {}` à l’interieur de ce bloc http pour configurer notre site wordpress. Il est aussi possible (et plus propre) de mettre ce bloc server dans un fichier dans le dossier `/etc/nginx/sites-enabled/`. Dans cet exemple, j’ai ajouté le bloc server directement dans le fichier `/etc/nginx/nginx.conf`

```bash
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
	worker_connections 768;
}

http {

	sendfile on;
	tcp_nopush on;
	tcp_nodelay on;
	keepalive_timeout 65;
	types_hash_max_size 2048;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;

	ssl_protocols TLSv1.2 TLSv1.3;
	ssl_prefer_server_ciphers on;

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	server {

		# listen on port 443 for incoming ipV4 connections
		listen 443 ssl default_server;
		# listen on port 443 for incoming ipV6 connections
		listen [::]:443 ssl default_server;

		#SSL/TLS Configuration
		ssl_certificate /etc/nginx/ssl/inception.crt;
		ssl_certificate_key /etc/nginx/ssl/inception.key;

		#root and index and server_name
		#redirection de localhost vers le site wordpress
		root /var/www/wordpress;

		# The underscore is a catch-all for server names (hostnames). 
		# This means this server block will respond to all requests that do not match a server name in another server block.
		server_name _;

		# Ajout de index.php comme conseillé par le "tuto"
		index index.php index.html index.htm index.nginx-debian.html;

		#pour les requêtes NON *.php
		location / {
			try_files $uri $uri/ =404;
		}

		#pour les requêtes *.php
		location ~ \.php$ {
			fastcgi_split_path_info ^(.+\.php)(/.+)$;
			fastcgi_pass	wordpress:9000;
			fastcgi_index	index.php;
			include			fastcgi_params;
			fastcgi_param	SCRIPT_FILENAME $document_root$fastcgi_script_name;
			fastcgi_param	PATH_INFO $fastcgi_path_info;
		}

	}

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
}
```

<aside>
💡 J’ai laissé _ pour le server_name. Peut-être serait-il plus judicieux de mettre [login.42.fr](http://login.42.fr) à la place, de sorte que notre serveur ne serve plus le site sur le domaine localhost…

</aside>

## Dockerfile

```docker
FROM debian:buster

# Mise à jour du manager de paquet
RUN apt-get update -y 
RUN apt upgrade -y

# Installation de nginx
RUN apt-get install -y nginx

# Installation de ssl et configuration du certificat
RUN mkdir -p /etc/nginx/ssl
RUN apt install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=SW/ST=VS/L=Lausane/O=42/OU=42/CN=login.42.ch/emailAddress=login@student.42.fr"

# Création des répertoires nécessaires au fonctionnement de nginx
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/wordpress

# Modification des droits pour que nginx puisse y accéder
RUN chmod -R 755 /var/www/wordpress

# Modification du propriétaire des fichiers et sous dossier du dossier /var/www/wordpress 
# Le propriétaire de ces fichiers correspond à l'utilisateur choisis dans le fichier de configuration de nginx
RUN chown -R www-data:www-data /var/www/wordpress

# Copie du fichier de configuration et du script de démarrage
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tool/start_ngx.sh /usr/local/start_ngx.sh
RUN chmod +x /usr/local/start_ngx.sh

# Exposition du port 443 qui est le port requis pour le protocole SSL (https)
EXPOSE 443

ENTRYPOINT ["sh", "/usr/local/start_ngx.sh"]
```

Le user sous lequel tourne nginx est www-data. C’est pourquoi il est indispensable de mettre l’utilisateur www-data comme propriétaire du dossier qui contient les fichier que nginx doit servir. 

## Script de démarage

```bash
echo "------------------------------- NGINX START -----------------------------------\n"

nginx -v

nginx -g 'daemon off;'
```

La commande `nginx -g ‘daemon off;’` impose à nginx de tourner en foreground plutôt qu’en background quelque soit ce qui a été paramétré dans le fichier de configuration. Il est indispensable de faire tourner nginx en “foreground” sinon le container s’arrêtera à la fin du script. Une autre solution aurait pû être de faire tourner nginx en background et de mettre une boucle infini dans le script. Mais cela est rigoureusement interdit par le sujet.

# Container pour Wordpress et php-fpm

## A propos de php-fpm

`php-fpm` (PHP FastCGI Process Manager) est une implémentation avancée et hautement performante de PHP FastCGI. Il est utilisé pour héberger des sites web écrits en PHP en fournissant une passerelle entre le serveur web (comme NGINX ou Apache) et le traitement des scripts PHP. Voici les principaux avantages et caractéristiques de php-fpm :

1. **Gestion avancée des processus** : php-fpm maintient des pools de processus prêts à répondre aux requêtes PHP. Cela signifie qu'il n'a pas besoin de démarrer un nouveau processus pour chaque requête, ce qui se traduit par une meilleure performance et une utilisation plus efficace des ressources.
2. **Adaptabilité et flexibilité** : Vous pouvez configurer php-fpm pour ajuster dynamiquement le nombre de processus en fonction de la charge, ou vous pouvez configurer un nombre fixe de processus. Cela le rend très adaptable à différents environnements et charges de travail.
3. **Compatibilité avec les serveurs web** : php-fpm est souvent utilisé avec des serveurs web comme NGINX en utilisant FastCGI, un protocole de communication entre le serveur web et un processus externe qui gère le traitement PHP. Cela permet une séparation claire des responsabilités et une architecture plus flexible.
4. **Gestion fine des ressources** : php-fpm offre des options pour contrôler finement l'utilisation des ressources, comme la mémoire et le temps CPU utilisés par chaque processus PHP.
5. **Sécurité** : En utilisant php-fpm, il est possible d'exécuter différents sites web sous différents utilisateurs du système d'exploitation, ce qui renforce la sécurité en isolant les sites les uns des autres.

En résumé, php-fpm est un gestionnaire de processus pour PHP qui améliore la performance, la gestion des ressources, et la sécurité des applications PHP, en particulier dans les environnements où le trafic web est élevé.

## Fichier de configuration de  php-fpm

```yaml
[www]

user = www-data
group = www-data

; Adresse sur laquelle accepter les requêtes FastCGI.
listen = wordpress:9000

listen.owner = www-data
listen.group = www-data

pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
```

La seule et unique ligne modifiée dans le fichier de configuration de base est `listen = wordpress:9000` qui est initialisé sur une socket par défaut : `listen = /run/php/php7.3-fpm.sock`. A gauche des “:” il y a wordpress qui est le nom du container. Cela remplace l’adresse IP du container au sein du réseau. A droite; il y a le numéro du port imposé par le sujet. Cependant 9000 est le port défaut pour le protocole fastCGI.

- **[www]** : nom du pool. Il s’agit d’un pool de processus. Il est possible de créer plusieurs pools par fichier. Chaque pool permet de configurer différement php-fpm. Cela est utile si le serveur héberge plusieurs sites web. Chaque pool sera affilié à un site web.
- **listen** : interface d’écoute des requêtes. Les syntaxes acceptées sont *ADRESSE_IP:PORT* (exemple : `listen = 127.0.0.1:9000`) et */path/to/unix/socket* (exemple : `listen = /var/run/blog.sock`). Comme nginx et php-fpm sont installés sur des containers différents, ils ont besoin d’une interface pour faire communiquer les 2 processus.
- **listen.owner** & **listen.group** : affecte l’utilisateur et le groupe au socket Unix si utilisé. Ces deux paramètres peuvent être associés au paramètre **listen.mode** qui définit les permissions du socket (660 par défaut). Il est important que *Nginx* ait les droits de lecture sur le socket Unix. Effectivement, si le user et le groupe n’ont pas les droits nécessaires sur le socket qui pemet le partage des inforamtions entre nginx et php-fpm, cela risque de poser problème. Cependant est-ce bien nécessaire de laisser ces 2 lignes puisqu’on utilise pas une socket mais un port pour communiquer ?
- **user** & **group** : utilisateur et groupe sous lesquels le pool de processus sera exécuté. Cet utilisateur et ce groupe doivent bien sûr exister sur votre système et surtout accéder aux fichiers PHP de votre WordPress. Cela veut dire aussi que chaque fichier et répertoire créé dans WordPress appartiendra à cet utilisateur et à ce groupe.

## Dockerfile

```docker
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
```

## Script de démarage de wordpress

```bash
echo "------------------------------- WORDPRESS START -----------------------------------"

php-fpm7.3 -v

# Boucle verification mariadb qui attend que mariadb soit up
while ! mariadb -u $MARIADB_USER --password=$MARIADB_PASS -h mariadb -P 3306 --silent; do
	sleep 1
	echo "Mariadb n'est pas encore pret"
done

# Affichage dans le terminal des bases de donnees
echo "------------------\n"
mariadb -u $MARIADB_USER --password=$MARIADB_PASS -h mariadb -P 3306 -e "SHOW DATABASES;"
echo "------------------\n"

# Installation de Wordpress si necessaire
if [ -e /var/www/wordpress/wp-config.php ]
then echo "wp-config existe."
else
	
	# Installation de wp-cli
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp	

	# Installation de wordpress
	cd /var/www/wordpress
	wp core download --allow-root

	# Configuration de wordpress : connection a la base de donnees et creation des users de wordpress (admin et user supplémentaire)
	wp config create --dbname=$MARIADB_DB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASS --dbhost=$WP_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root

fi

# Lancement de php-fpm
php-fpm7.3 -F
```

Les 3 lignes de configuration de worpress on pour rôle de modifier (ou créer) le fichier de configuration de wordpress qui permet au site de fonctionner. Si toutefois, ces lignes ne sont pas là, on tombe sur la page de démarrage de wordpress lorsqu’on se connecte au site.

![Screenshot 2024-02-11 at 14.28.22.png](https://github.com/FXC-ai/Inception/blob/main/Screenshot%202024-02-11%20at%2014.28.22.png)

Il ne faut surtout pas que cette page apparaisse pendant la correction sinon… C’est 0. En remplissant les champs à la main, il est possible de configurer le site manuellement.
Voici le fichier de configuration après création :

```php
<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** Database username */
define( 'DB_USER', 'login' );

/** Database password */
define( 'DB_PASSWORD', 'mypass' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'W^fi+}-1<=~?vy}Fqw%v=?;S]4Mr(P{L8nzUMUr7(I921{n|Azb[2taToPiz$d4|' );
define( 'SECURE_AUTH_KEY',  'o05!3,]!}M(`c9/c 8T22vYC=W% ]R!eqbU:&tM |/f~OkFX2k?)~i/icE)=nfb4' );
define( 'LOGGED_IN_KEY',    'S|h;jlf)srUYha0[Dx*cfI>k?EBt0Ma:su K|H&Xx0Zi8cW;)f+e*Sh$69Tn8tp$' );
define( 'NONCE_KEY',        'yph)VryL@I>][qU~CiLwxkpl3@s^x);uy}|`,3Cj,te*cqm>8q9,JZ>.Z^5E@@?u' );
define( 'AUTH_SALT',        '!0ZpRrgbhD?5~hNGSnd3q%-T{t>|(<.%sPmqZ-jj}($Z)gc+ty(T{bhMCaen&@}v' );
define( 'SECURE_AUTH_SALT', 'k DB)(HfwPd;.n86]yxmI{*J{Ttb(Y2d-EFizmPf1jE},65<(4,u4su@rmD|(@xb' );
define( 'LOGGED_IN_SALT',   'AS.sowH50r7`E@!%{J?%6]M-~Idl}g$5c?H7<*aqMV;_DvhtcLJ7~_d^w{y]p/<2' );
define( 'NONCE_SALT',       'eKD/WO6)CzGfyQY(F1!*rc?8<8<J,a_i~f2XNwB|(=G*NTmB[`v`~3{zfzgL6<DN' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
```

JE NE CONSEILLE ABSOLUMENT PAS DE FAIRE CA !!! Mais, il serait possible de configurer ce fichier à la main, de le cacher sur la machine virtuel et de le copier dans le dossier du projet au moment du build. Ensuite le Dockerfile pourrait se charger de copier ce fichier dans le container au même titre que le fichier de config de php-fpm. 

# Container pour mariadb

## Definition concernant les bases de données

Selon openclassroom, voici comment on peut se représenter une base de donnée :

![def_db.png](https://github.com/FXC-ai/Inception/blob/main/def_db.png)

Une **base de données** permet de stocker et de retrouver des données structurées, semi-structurées ou des données brutes ou de l'information, souvent en rapport avec un thème ou une activité ; celles-ci peuvent être de natures différentes et plus ou moins reliées entre elles.

Une **table** est un ensemble de données organisées sous forme d'un tableau où les colonnes correspondent à des catégories d'information (appelés `champs`) et les lignes à des enregistrements, également appelés `entrées`. Chaque table est l'implémentation physique d'une relation entre les différentes colonnes. Chaque correspondance est définie par une ligne de la table.

A titre d’exemple, la base do

## Systeme de fichier pour la configuration de mariaDB

Tout d’abord préçisons 2 choses. Mariadb est la version gratuite de mysql. En second lieu, pour comprendre la suite, il faut savoir que mysql est un serveur ! Entant que serveur il doit donc être configuré. Cette configuration comprend généralement divers paramètres tels que le codage des caractères par défaut, les délais d’attente, les configurations de cache et de tampon, qui peuvent être ajustés pour optimiser les performances de la base de données en fonction de l’utilisation.

Les fichiers de configuration de mariadb se trouvent dans le dossier `/etc/mysql/`.  Voici la liste des fichiers et dossiers qu’il contient :

```bash
root@d78710a2de0d:/etc/mysql: ls -alR 
.:
total 32
drwxr-xr-x 2 root root 4096 Feb  8 17:53 conf.d
-rwxr-xr-x 1 root root 1620 Jan 16 21:28 debian-start
-rw------- 1 root root  277 Feb  8 17:53 debian.cnf
-rw-r--r-- 1 root root  869 Jan 16 21:28 mariadb.cnf
drwxr-xr-x 2 root root 4096 Feb  8 17:53 mariadb.conf.d
lrwxrwxrwx 1 root root   24 Feb  8 17:53 my.cnf -> /etc/alternatives/my.cnf
-rw-r--r-- 1 root root  839 Aug  3  2016 my.cnf.fallback

./conf.d:
total 16
-rw-r--r-- 1 root root    8 Aug  3  2016 mysql.cnf
-rw-r--r-- 1 root root   55 Aug  3  2016 mysqldump.cnf

./mariadb.conf.d:
total 24
-rw-r--r-- 1 root root  733 Jan 16 21:28 50-client.cnf
-rw-r--r-- 1 root root  336 Jan 16 21:28 50-mysql-clients.cnf
-rw-r--r-- 1 root root 1032 Jan 16 21:28 50-mysqld_safe.cnf
-rw-r--r-- 1 root root 3940 Jan 16 21:28 50-server.cnf
```

Voici un résumé du rôle de chacun de ces fichiers :

- **Répertoire racine (/etc/mysql)** :
    - `debian-start` : Il s'agit d'un script qui est exécuté automatiquement lorsque le serveur MySQL ou MariaDB démarre sur un système Debian ou Ubuntu. Il effectue des tâches de maintenance et des vérifications. PAS TOUCHE !!!
    - `debian.cnf` : Contient les informations d'identification que les scripts et les tâches de maintenance utilisent pour effectuer des opérations de gestion automatiques sur le serveur MySQL ou MariaDB, comme les mises à jour ou les vérifications de bases de données, sans nécessiter d'authentification interactive. PAS TOUCHE NON PLUS !!!
    - `mariadb.cnf` : Fichier de configuration de base pour MariaDB, qui est un remplaçant direct de MySQL. Il définit certaines valeurs par défaut qui sont généralement recommandées pour MariaDB.
    - `my.cnf` : Il s'agit d'un lien symbolique vers le fichier de configuration MySQL ou MariaDB utilisé par le serveur. La cible de ce lien (/etc/alternatives/my.cnf) peut varier en fonction de la configuration du système et de l'utilisation ou non d'alternatives pour gérer plusieurs versions de MySQL.
    - `my.cnf.fallback` : Un fichier de configuration de secours que MySQL ou MariaDB peut utiliser si les fichiers de configuration primaires ne sont pas disponibles ou sont corrompus.

`mariadb.cnf` et `my.cnf` sont rigoureusements identiques dans leur contenu. La différence est dans les droits accordées à l’un ou à l’autre des fichiers. my.cnf possède les droits en ecriture. On peut donc le modifier. Ce n’est pas le cas de mariadb.cnf

- **Répertoire conf.d** : ce répertoire contient des fichiers de configuration supplémentaires que MySQL ou MariaDB lira au démarrage, étendant ou remplaçant les paramètres du fichier de configuration principal. Il permet une configuration modulaire :
    - `mysql.cnf` : Peut contenir des paramètres supplémentaires spécifiques à MySQL.
    - `mysqldump.cnf` : Fournit des paramètres pour l'utilitaire mysqldump, tels que les options par défaut à inclure lors du vidage des bases de données.
- **Répertoire mariadb.conf.d** : Similaire à conf.d, mais spécifique à MariaDB, contenant des paramètres qui étendent ou remplacent la configuration principale mariadb.cnf.
    - `50-server.cnf` : Fournit une large gamme de paramètres spécifiques au serveur qui influencent le comportement, les performances et les fonctionnalités du serveur MariaDB.
    - `50-client.cnf` : Paramètres de configuration pour les applications clientes MariaDB, définissant les valeurs par défaut pour la connexion des clients aux serveurs MariaDB.
    - `50-mysql-clients.cnf` : Un autre fichier de configuration pour les applications clientes. Il est similaire à 50-client.cnf mais peut contenir des paramètres plus spécifiques ou supplémentaires.
    - `50-mysqld_safe.cnf` : Contient des options pour le script mysqld_safe, qui est un script utilisé pour démarrer le serveur MariaDB en toute sécurité en incorporant certaines fonctions de sécurité et des options par défaut.

## Fichier de configuration de MariaBD

```bash
[server]

[mysqld]

user                    = mysql
pid-file                = /run/mysqld/mysqld.pid   #le dossier /run/mysqld/ sera créé via le Dockerfile
socket                  = /run/mysqld/mysqld.sock
port                    = 3306
basedir                 = /usr
datadir                 = /var/lib/mysql
tmpdir                  = /tmp
lc-messages-dir         = /usr/share/mysql
#skip-external-locking

bind-address            = 0.0.0.0

query_cache_size        = 16M

log_error = /var/log/mysql/error.log

expire_logs_days        = 10

character-set-server  = utf8mb4
collation-server      = utf8mb4_general_ci

[embedded]

[mariadb]

[mariadb-10.3]
```

Les 2 lignes modifiées par rapport au fichier de configuration par défaut sont :

- la ligne du port qui a été décommentée.

La directive port dans le fichier de configuration de MySQL spécifie le numéro de port sur lequel le serveur MySQL écoute les connexions entrantes. Par défaut, MySQL utilise le port 3306, qui est un port standard pour les serveurs MySQL. La modification de cette valeur vous permet de sécuriser votre serveur MySQL en rendant l'accès à la base de données plus difficile pour les utilisateurs non autorisés, étant donné qu'il écoute sur un port différent, potentiellement moins prévisible. 

<aside>
💡 Sachant cela, est-il vraiment nécessaire de décommenter cette ligne puisque de toute façon mysql écoute par défaut sur le port 3306 ?

</aside>

- bind-address

La directive bind-address détermine l'adresse IP sur laquelle le serveur MySQL doit écouter. La valeur 0.0.0.0 signifie que le serveur écoutera sur toutes les interfaces réseau disponibles, ce qui lui permet d'accepter des connexions à partir de n'importe quelle adresse IP. Ceci est nécessaire si vous souhaitez autoriser des connexions externes à votre serveur MySQL à partir d'autres machines du réseau ou d'Internet. Si l'adresse bind est fixée à 127.0.0.1, le serveur n'écoutera que les connexions provenant de la machine locale, limitant ainsi l'accès externe. 

<aside>
💡 Sachant cela, cela n’aurait-il pas été plus judicieux de n’écouter que sur l’adresse IP du container Wordpress ? Cela aurait-il fonctionné en remplaçant 0.0.0.0 par le nom du container (wordpress)?

</aside>

## Dockerfile

```docker
FROM debian:buster

#Installation de mariaDB
RUN apt update -y && apt upgrade -y
RUN apt-get install -y mariadb-server procps

#Creation du repertoire de travail. /var/lib/mysql est le data direcory
RUN mkdir -p /run/mysqld /var/lib/mysql

#Copie des fichiers de configuration et du script de démarrage
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/start_mdb.sh /usr/local/start_mdb.sh
RUN chmod +x /usr/local/start_mdb.sh

#Port de connexion
EXPOSE 3306

ENTRYPOINT [ "sh", "/usr/local/start_mdb.sh" ]
```

## Script de démarage de mariadb

```bash
echo "------------------------------- MARIADB START -------------------------------------"

# Initialisation de la base de données
mysqld --initialize --user=mysql --datadir=/var/lib/mysql;

chown -R mysql:mysql /var/lib/mysql;
chown -R mysql:mysql /run/mysqld;

# Lancement de mariadb en arrière plan
mysqld --user=mysql --datadir=/var/lib/mysql &

# On met la valeur du pid dans une variable afin de pouvoir kill le process
# lorsque la configuration de mariadb sera terminé
pid=$!

# Attente de la fin de lancement de mariadb
sleep 10

# Configuration de la base de données
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DB_NAME};"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}' IDENTIFIED BY '${MARIADB_PASS}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}';"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Affichage des bases de données dans le terminal
echo "------------------\n"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "SHOW DATABASES;"
echo "------------------\n"
mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "SELECT User FROM mysql.user"
echo "------------------\n"

# Kill de mysqld
kill "$pid"

# Remplacement du processus shell par mysqld
exec mysqld --user=mysql --datadir=/var/lib/mysql
```

---

| `mysqld --initialize --user=mysql --datadir=/var/lib/mysql;` | Cette commande permet d’initialiser le user et le data directory pour mysql : 
- Comme son nom le data directory qui contiendra la base de donnée. 
- Le user est le user qui fera les requêtes sur la base donnée |
| --- | --- |
| `chown -R mysql:mysql /var/lib/mysql;
chown -R mysql:mysql /run/mysqld;` | Ces 2 commandes modifient le propriétaire du répertoire |

En exécutant mysqld en arrière-plan, vous démarrez le daemon du serveur MySQL sans bloquer le terminal. Cela permet au terminal d'être disponible pour d'autres commandes et tâches pendant que le serveur MySQL continue de fonctionner en arrière-plan. Lorsque la configuration est terminée, il faut éteindre mysqld et le relancer en foreground afin de garder le container up.

Ensuite on peut effectuer des opérations sur la DB avec la commande `mysql -e “CMD_MYSQL”`

Il est aussi possible de lancer mysql : `mysql -v` et ainsi pouvoir effectuer directement les requêtes sur les DB

Pour tester mysql en CLI : `docker exec -ti ID_CONTAINER bash`

<aside>
💡 Il faut absolument penser que les volumes sont persistants d’un démarage sur l’autre de l’image. Même si l’image a été rebuild le volume reste le même quand on la lance via un container ! Cela peut poser des problèmes en particulier si la nouvelle image utilise des mots de passe différents du préférent build.

</aside>

# Comment passer le projet sur la VM

## Installation de la VM

Tout d’abord il faut installer un OS sur la VM. Pour cela quelques recommandations :

- installer sur le goinfre ou le sgoinfre. De toute façon il est impossible d’installer une VM su une session 42, elles ne contiennent pas assez de mémoire.
- Pour le choix de l’OS, je conseille une distribution DEBIAN avec une interface graphique

[](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso)

- Il faut installer ssh et utiliser les même clés que pour la session de 42. Pour copier/coller facilement les clés de la session sur la VM, je conseille de se connecter en ssh depuis un terminal sur la session 42. Pour cela : `ssh user@127.0.0.1 -p 4242` et entrer le mot de passe de l’utilisateur choisis. Pour permettre cela il faut absolument rediriger le port de la VN sur le port 4242.
- Installer git
- Il faudra ensuite installer Docker sur la VM

[Install Docker Engine on Debian](https://docs.docker.com/engine/install/debian/#install-using-the-repository)

## Modifications à apporter au projet pour la correction sur la VM

- Nom de domaine dans le fichier host. Le sujet impose que le nom de domaine soit login.42.fr
- Nom de domaine dans le .env_private
- Chemins dans le Dockerfile
- Chemins dans le Makefile
- Adapter les commandes dans le makefile

<aside>
💡 ATTENTION A NE PAS LAISSER LE FICHIER .ENV DANS LE DOSSIER DU PROJET. Il faut mettre le fichier .env sur la VM. Ensuite au moment de la correction, on git clone le projet et le Makefile se chargera de copier le fichier .env qui est stocké sur la VM dans le dossier du projet.

</aside>

# Sources

https://github.com/vbachele/Inception

[42 Inception TIPS](https://tuto.grademe.fr/inception/)

[How to use MariaDB with Docker and docker-compose for development](https://www.beekeeperstudio.io/blog/how-to-use-mariadb-with-docker#create-a-docker-composeyml-file)

[Liste des instructions dans le dockerfile](https://www.nicelydev.com/docker/mots-cles-supplementaires-dockerfile#h2_1)

[How To Create a New User and Grant Permissions in MySQL  | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql)

[C.2. The Directory Tree](https://www.debian.org/releases/bullseye/amd64/apcs02.en.html)

[Network drivers overview](https://docs.docker.com/network/drivers/)

[Volumes top-level elements](https://docs.docker.com/compose/compose-file/07-volumes/)

[How to stop docker under Linux](https://stackoverflow.com/questions/42365336/how-to-stop-docker-under-linux)

[MySQL :: MySQL 8.0 Reference Manual :: 2.9 Postinstallation Setup and Testing](https://dev.mysql.com/doc/refman/8.0/en/postinstallation.html)

[Répertoires et systèmes de fichiers](https://help.ubuntu.com/kubuntu/desktopguide/fr/directories-file-systems.html)
