FROM debian:oldstable

RUN apt update &&  apt upgrade -y && \
	apt install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/private.key \
	-out /etc/ssl/certs/certificate.crt \
	-subj "/C=BR/ST=SP/L=SãoPaulo/O=42sp/CN=revieira.42.fr"

COPY ./tools/index.html /usr/share/nginx/html
COPY ./tools/imgs /usr/share/nginx/html/imgs
COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
