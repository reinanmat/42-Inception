FROM debian:oldstable

RUN apt update &&  apt upgrade -y && \
	apt install -y \
	nginx && \
	rm -rf /var/lib/apt/lists/*

COPY ./tools/index.html /usr/share/nginx/html
COPY ./tools/imgs /usr/share/nginx/html/imgs
COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
