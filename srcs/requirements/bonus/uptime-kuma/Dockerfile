FROM debian:oldstable

RUN apt update && apt upgrade -y && \
	apt install -y \
	git \
	wget && \
	rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN . /root/.bashrc && nvm install v20.4 && \
	git clone https://github.com/louislam/uptime-kuma.git && \
	cd uptime-kuma && npm run setup

RUN mkdir uptime-kuma-data

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

WORKDIR /uptime-kuma

ENTRYPOINT ["/tmp/entrypoint.sh"]
