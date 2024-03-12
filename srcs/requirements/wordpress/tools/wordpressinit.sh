#!/bin/bash

if [ -f /var/www/html/wp-config-sample.php ]; then
	rm -rf /var/www/html/wp-config-sample.php
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
fi

exec php-fpm7.4 -F
