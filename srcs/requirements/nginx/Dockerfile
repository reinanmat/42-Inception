FROM debian:oldstable

RUN apt-get update -y && apt-get install -y \
	nginx \
	openssl

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/localhost.key \
	-out /etc/ssl/certs/localhost.crt

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
