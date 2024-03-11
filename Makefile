all:
	cd ./srcs/ && \
	docker-compose up

uptime:
	docker run -d --restart=always -p 3001:3001 \
		-v /var/run/docker.sock:/var/run/docker.sock -v uptime-kuma:/app/data \
		--name uptime-kuma louislam/uptime-kuma:1


delete-volumes:
	sudo rm -rf /home/revieira/data/mariadb/*
	sudo rm -rf /home/revieira/data/wordpress/*

clean: delete-volumes
	docker system prune -fa

re: clean all
