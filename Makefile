NAME = inception
PATH_DOCKER_COMPOSE = srcs/docker-compose.yml
PATH_V_WORDPRESS = /Users/fcoindre/data/wordpress
PATH_V_MARIADB = /Users/fcoindre/data/mariadb
PATH_TO_ENV_FILE = /Users/fcoindre/Desktop/.private_env

all : build run-daemon

run:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up

run-daemon:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up -d

down:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} down

build:
	cp ${PATH_TO_ENV_FILE} srcs/.env
	if [ ! -d ${PATH_V_WORDPRESS} ]; then \
		mkdir -p ${PATH_V_WORDPRESS}; \
	fi
	if [ ! -d ${PATH_V_MARIADB} ]; then \
		mkdir -p ${PATH_V_MARIADB}; \
	fi
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} build

clean:
	docker system prune --images -a

fclean: down
	docker system prune -a
	docker volume prune
	docker volume rm wordpress_v
	docker volume rm mariadb_v

re: fclean all

status :
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} ps -a
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} images
	docker container ls -a
	docker volume ls

.PHONY: all clean fclean re status stop run run-daemon down build