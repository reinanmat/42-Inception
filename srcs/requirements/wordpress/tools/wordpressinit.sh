#!/bin/bash

wp core install --allow-root \
	--path=/var/www/html \
	--url=reviera.42.fr \
	--title="Inception" \
	--admin_user='admin' \
	--admin_password='admin' \
	--admin_email='revieira@student.42sp.org.br'

wp user create --allow-root	\
	--path=/var/www/html \
	'test' 'test@test.com' \
	--user_pass='test'

exec php-fpm7.4 -F
