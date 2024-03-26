FROM debian:oldstable

WORKDIR /var/www/adminer

RUN apt update && apt upgrade -y && \
	apt install -y \
	php7.4 \
	php-fpm \
	php-mysql \
	wget && \
	rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php -O index.php && \
	chown -R www-data:www-data index.php && \
	chmod 755 index.php

RUN mkdir /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]
