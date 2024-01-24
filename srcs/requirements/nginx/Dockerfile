FROM debian:buster

RUN apt-get update
RUN apt upgrade -y

RUN apt-get install -y nginx

RUN apt-get install procps -y

RUN apt install -y vim
RUN apt install -y curl

RUN mkdir -p /etc/nginx/ssl

RUN apt install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=SW/ST=VS/L=Lausane/O=42/OU=42/CN=fcoindre.42.ch/emailAddress=fcoindre@student.42.fr"

RUN cat /etc/nginx/ssl/inception.crt /etc/nginx/ssl/inception.key

RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/conf0.conf /etc/nginx/conf.d/conf0.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

