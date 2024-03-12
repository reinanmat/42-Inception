FROM debian:oldstable

WORKDIR /var/www/html/

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	wordpress \
	# sendmail \
	wget && \
	rm -rf /var/lib/apt/lists/*

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp
RUN wp core download --allow-root --path=/var/www/html

RUN mkdir /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/wp-config.php /var/www/html/wp-config.php
COPY ./tools/wordpressinit.sh /tmp/wordpressinit.sh

RUN chmod +x /tmp/wordpressinit.sh

ENTRYPOINT ["/tmp/wordpressinit.sh"]
