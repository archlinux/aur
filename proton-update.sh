#!/bin/bash

mkdir -p /usr/share/proton-update

if [ ! -f "/usr/share/proton-update/url" ]; then
    touch "/usr/share/proton-update/url"
fi

URL_CACHED=$(cat "/usr/share/proton-update/url")

DIR=$(mktemp -d)
cd "$DIR"

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo or as root."
    exit 1
fi

set -e

LINE="IgnorePkg = proton-cachyos"
FILE="/etc/pacman.conf"

URL_SUFFIX=$(curl -s https://packages.cachyos.org/package/cachyos/x86_64/proton-cachyos | grep -oP 'proton-cachyos-[^"]+\.pkg\.tar\.zst' | sort -V | head -n1)

URL="https://cdn77.cachyos.org/repo/x86_64/cachyos/$URL_SUFFIX"

if [ "$URL" = "$URL_CACHED" ]; then
    echo "No new proton-cachyos version detected"
    exit
fi

echo "$URL" > "/usr/share/proton-update/url"

curl "$URL" --output proton-cachyos.pkg.tar.zst 

pacman -U proton-cachyos.pkg.tar.zst --needed || true

rm -r proton-cachyos.pkg.tar.zst

if ! grep -Fxq "$LINE" "$FILE"; then
    echo "[options]" | tee -a "$FILE" > /dev/null
    echo "$LINE" | tee -a "$FILE" > /dev/null
    echo "Added '$LINE' to $FILE"
fi
