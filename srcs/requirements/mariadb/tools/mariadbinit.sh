#!/bin/bash

service mariadb start

mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
	CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; \
	GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; \
	FLUSH PRIVILEGES;"
