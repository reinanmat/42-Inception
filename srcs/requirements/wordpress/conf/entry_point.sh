#!/bin/bash

wp core install --url=example.com --title=Example --admin_user=supervisor \
	--admin_password=strongpassword --admin_email=info@example.com --allow-root

php-fpm7.4 -F
