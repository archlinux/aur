#!/usr/bin/env bash
_parch=$(uname -m | sed "s/x86_64/x64/;s/aarch64/arm64/")

install -d "/home/$1/.config/clash"
ln -sf /etc/clash/Country.mmdb -t "/home/$1/.config/clash"

install -d "/home/$1/.config/clash/service"
ln -sf "/opt/clash-for-windows/static/files/linux/${_parch}/service/clash-core-service" \
     -t "/home/$1/.config/clash/service"
