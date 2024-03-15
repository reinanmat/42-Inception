LOGIN=revieira
DOCKER_COMPOSE_PATH=./srcs/docker-compose.yml

all: up

setup:
	sudo chmod a+w /etc/hosts
	sudo cat /etc/hosts | grep $(LOGIN) || sudo echo "127.0.0.1 $(LOGIN).42.fr" >> /etc/hosts
	sudo mkdir -p /home/$(LOGIN)/data/mariadb
	sudo mkdir -p /home/$(LOGIN)/data/wordpress

up: setup
	docker-compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE_PATH) down

delete-volumes:
	docker volume rm $(shell docker volume ls -q)
	sudo rm -rf /home/$(LOGIN)/data/mariadb/*
	sudo rm -rf /home/$(LOGIN)/data/wordpress/*

ls:
	@echo "IMAGES:"
	@docker image ls -a
	@echo "\nCONTAINERS:"
	@docker container ls -a
	@echo "\nVOLUMES:"
	@docker volume ls
	@echo "\nNETWORKS:"
	@docker network ls -f type=custom

clean:
	docker image prune -af

fclean: delete-volumes
	docker system prune -fa

re: fclean all

.PHONY: all up down delete-volumes ls clean fclean re

uptime:
	docker run -d --restart=always -p 3001:3001 \
		-v /var/run/docker.sock:/var/run/docker.sock -v uptime-kuma:/app/data \
		--name uptime-kuma louislam/uptime-kuma:1
