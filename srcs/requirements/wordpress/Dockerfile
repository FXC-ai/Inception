FROM debian:buster

RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y wget

RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.4.2-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY tool/start_wdp.sh /usr/local/start_wdp.sh

RUN chmod +x /usr/local/start_wdp.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/usr/local/start_wdp.sh"]