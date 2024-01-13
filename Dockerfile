FROM debian:bullseye

RUN apt-get -y update && apt-get -y install nginx