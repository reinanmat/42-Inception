LOGIN=revieira
DOCKER_COMPOSE_PATH=./srcs/docker-compose.yml
DOT_ENV=https://github.com/reinanmat/42-Inception/raw/master/srcs/.env

VOLUMES= /home/$(LOGIN)/data/mariadb \
		 /home/$(LOGIN)/data/wordpress \
		 /home/$(LOGIN)/data/adminer \
		 /home/$(LOGIN)/data/uptime-kuma

all: up

setup:
	sudo mkdir -p $(VOLUMES)
	@if [ ! -f ./srcs/.env ]; then \
		wget -O ./srcs/.env $(DOT_ENV); \
	fi
	@if ! grep -q $(LOGIN) /etc/hosts; then \
		echo "127.0.0.1 $(LOGIN).42.fr" | sudo tee -a /etc/hosts > /dev/null; \
	fi

up: setup
	docker-compose -f $(DOCKER_COMPOSE_PATH) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE_PATH) down

delete-volumes:
	@echo -n "Delete volumes? (Y/n) "
	@read -r answer; \
	if [ "$$answer" = "Y" ] || [ "$$answer" = "y" ]; then \
		docker volume rm $$(docker volume ls -q); \
		sudo rm -rf $(VOLUMES); \
	fi

ls:
	@echo "IMAGES:"
	@docker image ls -a
	@echo "\nCONTAINERS:"
	@docker container ls -a
	@echo "\nVOLUMES:"
	@docker volume ls
	@echo "\nNETWORKS:"
	@docker network ls -f type=custom

links:
	@echo "wordpress:	https://$(LOGIN).42.fr:443"
	@echo "adminer:	https://$(LOGIN).42.fr:443/adminer"
	@echo "static-website:	https://$(LOGIN).42.fr:443/static-website"
	@echo "uptime-kuma:	http://$(LOGIN).42.fr:3001"

clean:
	docker image prune -af

fclean: down delete-volumes
	docker system prune -fa

re: fclean all

.PHONY: all up down delete-volumes ls links clean fclean re
