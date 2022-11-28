lancer un docker : docker build -t "Nom que tu veux lui donner" "emplacement du docker"

docker ps : te montre tous les docker créer
docker ps -a : te montre les docker créer et les dockers inactifs
docker run -d "nom du docker que tu veux lancer" : lance ton docker
docker stop "ID du docker que tu veux stopper" : arrete le docker
docker exec -it "ID du docker" "/bin/bash"
docker-compose up --build  : lancer docker compose
