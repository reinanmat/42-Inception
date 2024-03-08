FROM debian:oldstable

WORKDIR /var/www/html/

RUN apt-get update && apt-get install -y \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	wordpress \
	wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root --path=/var/www/html
RUN rm /var/www/html/wp-config-sample.php

RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/wp-config.php /var/www/html/wp-config.php
COPY conf/entry_point.sh /tmp/

RUN chmod +x /tmp/entry_point.sh

ENTRYPOINT ["/tmp/entry_point.sh"]
