FROM debian:oldstable

RUN apt update && apt upgrade -y && \
	apt install -y redis

COPY ./conf/redis.conf /etc/redis/redis.conf
RUN mkdir /data && chmod 755 /data && chown redis:redis /data

CMD ["redis-server",  "/etc/redis/redis.conf"]
