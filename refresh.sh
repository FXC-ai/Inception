cd srcs
docker-compose down
docker volume ls
docker system prune --volumes -a
docker volume rm -f $(docker volume ls -q)
docker volume ls
cd ..