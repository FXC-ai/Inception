sh state.sh

echo "\n"

docker stop $(docker ps -a -q)

docker container rm -f $(docker container ls -a -q)

docker image rm -f $(docker image ls -a -q)

docker volume rm -f $(docker volume ls -q)

echo "All containers and images are removed"