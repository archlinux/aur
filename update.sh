#!/bin/bash

latest=$(curl -s https://api.github.com/repos/nab138/iloader/releases/latest)

version=$(jq -r '.tag_name' <<< $latest)
version=${version:1}

hash=$(jq -r '.assets[] | select(.name == "iloader-linux-amd64.AppImage") | .digest' <<< $latest)
hash=${hash#sha256:}

sed -i \
    -e "s|_version=.*|_version='$version'|" \
    -e "s|_checksum=.*|_checksum='$hash'|" \
    './PKGBUILD'

makepkg --printsrcinfo > .SRCINFO
