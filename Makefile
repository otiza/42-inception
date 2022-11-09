SRC= srcs
VOLUMES = /User/amaaiza/data

all: up
add_dirs:
	mkdir -p /home/amaaiza/data/db
	mkdir -p /home/amaaiza/data/wp

# add_host:
# 	echo "127.0.1.1       amaaiza.42.fr" >> /etc/hosts

stop:
	docker compose -f srcs/docker-compose.yml stop 

restart:
	docker compose srcs/docker-compose.yml restart

build:
	docker compose srcs/docker-compose.yml build 
up:
	docker compose srcs/docker-compose.yml up 

down : 
	docker compose srcs/docker-compose.yml  down

clean: down
	docker system prune -a -f
	docker image prune -f
	docker volume prune -f
	docker network prune -f
	docker images -q | xargs -r docker rmi
	docker volume ls -q | xargs -r  docker volume rm
