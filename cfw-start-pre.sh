#!/usr/bin/env bash
_parch=$(uname -m | sed "s/x86_64/x64/;s/aarch64/arm64/")
install -Dm644 -o $1 -g $1 /etc/clash/Country.mmdb -t "/home/$1/.config/clash"
install -Dm755 -o $1 -g $1 \
    "/opt/clash-for-windows/static/files/linux/${_parch}/service/clash-core-service" \
    -t "/home/$1/.config/clash/service"
