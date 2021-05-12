#!/bin/sh -e
sed -i 's/1234567/$QQ/' /usr/src/app/QQMusicApi/bin/config.js

cd /usr/src/app/NeteaseCloudMusicApi && npm run start &
sleep 5

cd /usr/src/app/QQMusicApi && npm run start &
sleep 5

exec "$@"