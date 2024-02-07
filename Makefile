NAME = inception
PATH_DOCKER_COMPOSE = srcs/docker-compose.yml
PATH_V_WORDPRESS = /Users/fcoindre/data/wordpress
PATH_V_MARIADB = /Users/fcoindre/data/mariadb
PATH_TO_ENV_FILE = /Users/fcoindre/Desktop/.private_env
RESET_COLOR = \033[0m

all : down build run-daemon

run:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up

run-daemon:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up -d

down:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} down

stop:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} stop

build:
	cp ${PATH_TO_ENV_FILE} srcs/.env
	if [ ! -d ${PATH_V_WORDPRESS} ]; then \
		mkdir -p ${PATH_V_WORDPRESS}; \
	fi
	if [ ! -d ${PATH_V_MARIADB} ]; then \
		mkdir -p ${PATH_V_MARIADB}; \
	fi
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} build

clean: down
	docker system prune -a

fclean: down
	docker system prune -a --volumes
	docker volume rm $$(docker volume ls -q) || true

re: fclean all

delete-volumes :
	docker system prune -a --volumes

status :
	@echo "\033[44mContainers :${RESET_COLOR}"
	@docker container ls -a
	@echo ""

	@echo "\033[44mImages :${RESET_COLOR}"
	@docker image ls
	@echo ""
	
	
	@echo "\033[44mVolumes :${RESET_COLOR}"
	@docker volume ls
	@echo ""

	@echo "\033[44mNetwork :${RESET_COLOR}"
	@docker network ls
	@echo ""


.PHONY: all clean fclean re status stop run run-daemon down build