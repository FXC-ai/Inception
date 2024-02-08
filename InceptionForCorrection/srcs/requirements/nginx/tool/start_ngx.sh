echo "------------------------------- NGINX START -----------------------------------\n"

nginx -v

#force to run nginx in foreground in order to keep the container alive
nginx -g 'daemon off;'



