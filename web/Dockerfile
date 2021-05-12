#
# Dockerfile for NetEasyMusic-web
#

FROM node:lts-alpine as builder

RUN apk --update add --no-cache git \
    && rm -rf /tmp/* /var/cache/apk/*

RUN set -ex \
    && git clone https://github.com/jsososo/NeteaseMusic.git \
    && cd NeteaseMusic \
    && npm install \
    && npm run build

FROM nginx:alpine

COPY --from=builder /NeteaseMusic/dist/ /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80/tcp