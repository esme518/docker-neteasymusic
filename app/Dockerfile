#
# Dockerfile for NetEasyMusic-app
#

FROM node:lts-alpine

WORKDIR /usr/src/app

RUN apk --update add --no-cache git \
    && rm -rf /tmp/* /var/cache/apk/*

RUN set -ex \
    && git clone https://github.com/Binaryify/NeteaseCloudMusicApi.git \
    && cd NeteaseCloudMusicApi \
    && git checkout bf50fa65eb6ef9c5d002fe708746e175d3a1eefe \
    && rm -f package-lock.json \
    && rm -rf .idea \
    && rm -rf node_modules \
    && npm install

RUN set -ex \
    && git clone https://github.com/jsososo/QQMusicApi.git \
    && cd QQMusicApi\
    && npm install

RUN set -ex \
    && git clone https://github.com/jsososo/MixMusicApi.git \
    && cd MixMusicApi \
    && sed -i '/migu:/d' bin/config.js \
    && npm install

COPY entrypoint.sh /entrypoint.sh

ENV QQ 1234567

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /usr/src/app/MixMusicApi

CMD ["npm", "run", "start"]
