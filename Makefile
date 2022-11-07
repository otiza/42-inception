
   
SRC= srcs
VOLUMES = /User/amaaiza

all: up
add_dirs:
	mkdir -p /home/amaaiza/db
	mkdir -p /home/amaaiza/wp

# add_host:
# 	echo "127.0.1.1       aali-mou.42.fr" >> /etc/hosts 2

stop:
	docker compose -f srcs/docker-compose.yaml stop 

restart:
	docker compose -f srcs/docker-compose.yaml restart

build:
	docker compose -f srcs/docker-compose.yaml build 
up:
	docker compose -f srcs/docker-compose.yaml up -d

down : 
	docker compose -f srcs/docker-compose.yaml  down

clean: down
	docker system prune -a -f
	docker image prune -f
	docker volume prune -f
	docker network prune -f
	docker images -q | xargs -r docker rmi
	docker volume ls -q | xargs -r  docker volume rm

fclean: clean
