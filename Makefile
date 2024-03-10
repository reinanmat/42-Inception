all:
	cd ./srcs/ && \
	docker-compose up

delete-volumes:
	sudo rm -rf /home/revieira/data/mariadb/*
	sudo rm -rf /home/revieira/data/wordpress/*

clean: delete-volumes
	docker system prune -fa

re: clean all
