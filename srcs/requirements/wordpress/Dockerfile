FROM debian:buster

RUN echo "--------------------- wordpress Dockerfile START ---------------------"

RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y wget

RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client


# RUN wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www

# RUN cd /var/www && tar -xzf wordpress-6.4.2-fr_FR.tar.gz

# RUN chown -R root:root /var/www/wordpress

RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY tool/start_wdp.sh /usr/local/start_wdp.sh

# COPY conf/wp-config.php /var/www/wordpress/wp-config.php


#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp


RUN chmod +x /usr/local/start_wdp.sh



EXPOSE 9000

RUN echo "--------------------- wordpress Dockerfile END ---------------------"



ENTRYPOINT ["sh", "/usr/local/start_wdp.sh"]