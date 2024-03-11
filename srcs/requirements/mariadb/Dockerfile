FROM debian:oldstable

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

RUN apt update && apt upgrade -y && \
	apt install -y \
	mariadb-server && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

RUN echo "[mysqld] \n\
		skip-networking=0 \n\
		skip-bind-address" >> /etc/mysql/my.cnf

COPY ./tools/mariadbinit.sh /tmp/mariadbinit.sh
RUN chmod +x /tmp/mariadbinit.sh

RUN /tmp/mariadbinit.sh

CMD ["mysqld_safe"]
