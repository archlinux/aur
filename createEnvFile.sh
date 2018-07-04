#!/usr/bin/env sh
printf "# MERGED ON RUNTIME\! #\n#/usr/share/rocketchat-server/docker.env:\n" > .env
cat /usr/share/rocketchat-server/docker.env >> .env
printf "\n#/etc/rocketchat-server/docker.env:\n" >> .env
cat /etc/rocketchat-server/docker.env >> .env

