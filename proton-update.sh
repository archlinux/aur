#!/bin/bash

DIR=$(mktemp -d)
cd "$DIR"

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo or as root."
    exit 1
fi

set -e

LINE="IgnorePkg = proton-cachyos"
FILE="/etc/pacman.conf"

BASE_URL="https://packages.cachyos.org/package/cachyos/x86_64/proton-cachyos"

URL_SUFFIX=$(curl -s https://packages.cachyos.org/package/cachyos/x86_64/proton-cachyos | grep -oP 'proton-cachyos-[^"]+\.pkg\.tar\.zst' | sort -V | head -n1)

URL="https://cdn77.cachyos.org/repo/x86_64/cachyos/$URL_SUFFIX"

curl "$URL" --output proton-cachyos.pkg.tar.zst

pacman -U proton-cachyos.pkg.tar.zst --needed

rm -r proton-cachyos.pkg.tar.zst

if ! grep -Fxq "$LINE" "$FILE"; then
    echo "[options]" | tee -a "$FILE" > /dev/null
    echo "$LINE" | tee -a "$FILE" > /dev/null
    echo "Added '$LINE' to $FILE"
fi
