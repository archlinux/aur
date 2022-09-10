#!/usr/bin/env bash
_parch=$(uname -m | sed "s/x86_64/x64/;s/aarch64/arm64/")
ln -sf /etc/clash/Country.mmdb "/home/$1/.config/clash"
ln -sf "/opt/clash-for-windows/static/files/linux/${_parch}/service/clash-core-service" \
     "/home/$1/.config/clash/service"
