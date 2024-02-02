NAME = inception
PATH = srcs/docker-compose.yml

all:
	cp .private_env .env


	docker-compose -f ${PATH} -p ${NAME} up --build

clean:
	docker system prune --images -a

fclean:
	docker system prune --images -a
	docker system prune --volumes -a

re: fclean all

.PHONY: all clean fclean re