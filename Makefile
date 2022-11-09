
# add_host:
# 	echo "127.0.1.1       amaaiza.42.fr" >> /etc/hosts

stop:
	docker compose -f srcs/docker-compose.yml stop 

restart:
	docker compose srcs/docker-compose.yml restart

build:
	docker compose srcs/docker-compose.yml build 
up:
	docker compose ./srcs/docker-compose.yml up 

down : 
	docker compose ./srcs/docker-compose.yml  down

clean:
	docker system prune -a -f
	docker volume rm srcs_db
	docker volume rm srcs_wordpress