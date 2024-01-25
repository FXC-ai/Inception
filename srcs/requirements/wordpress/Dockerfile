FROM debian:buster

RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y wget

RUN apt-get -y install php php-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.4.2-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN mkdir -p /run//php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["php-fpm7.3", "-F"]