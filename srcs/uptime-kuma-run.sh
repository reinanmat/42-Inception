#!/bin/bash

docker run -d --restart=always -p 3001:3001 \
			-v /var/run/docker.sock:/var/run/docker.sock -v uptime-kuma:/app/data \
			--name uptime-kuma louislam/uptime-kuma:1
