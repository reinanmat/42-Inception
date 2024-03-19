FROM debian:oldstable

RUN apt update &&  apt upgrade -y && \
	apt install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/localhost.key \
	-out /etc/ssl/certs/localhost.crt

COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
