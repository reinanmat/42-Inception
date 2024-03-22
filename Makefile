LOGIN=revieira
DOCKER_COMPOSE_PATH=./srcs/docker-compose.yml
VOLUMES= /home/$(LOGIN)/data/mariadb \
		 /home/$(LOGIN)/data/wordpress \
		 /home/$(LOGIN)/data/adminer \
		 /home/$(LOGIN)/data/uptime-kuma

all: up

setup:
	sudo bash -c 'cat /etc/hosts | grep $(LOGIN) &> /dev/null || echo "127.0.0.1 $(LOGIN).42.fr" >> /etc/hosts'
	sudo mkdir -p $(VOLUMES)

up: setup
	docker-compose -f $(DOCKER_COMPOSE_PATH) up -d --build

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

clean:
	docker image prune -af

fclean: down delete-volumes
	docker system prune -fa

re: fclean all

.PHONY: all up down delete-volumes ls clean fclean re
