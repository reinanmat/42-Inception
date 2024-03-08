FROM debian:oldstable

RUN apt-get update && apt-get install -y \
	mariadb-server

RUN echo "[mysqld] \n\
	skip-networking=0 \n\
	skip-bind-address" >> /etc/mysql/my.cnf

RUN service mariadb start && \
	mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS wordpress_db; \
	CREATE USER 'wuser'@'%' identified by 'wpass'; \
	GRANT ALL ON wordpress_db.* TO 'wuser'@'%' IDENTIFIED BY 'wpass'; \
	FLUSH PRIVILEGES;" && \
	service mariadb stop

ENTRYPOINT ["mysqld_safe"]
