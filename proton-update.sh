#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo or as root."
    exit 1
fi

LINE="IgnorePkg = proton-cachyos"
FILE="/etc/pacman.conf"

if ! grep -Fxq "$LINE" "$FILE"; then
    echo ":: Adding "$LINE" to $FILE"
    echo "[options]" | tee -a "$FILE" > /dev/null
    echo "$LINE" | tee -a "$FILE" > /dev/null
    echo "  Added '$LINE' to $FILE"
fi

mkdir -p /usr/share/proton-update

if [ ! -f "/usr/share/proton-update/url" ]; then
    touch "/usr/share/proton-update/url"
fi

echo ":: Fetching cached proton-cachyos version"

URL_CACHED=$(cat "/usr/share/proton-update/url")

echo ":: Changing to temporal directory"

DIR=$(mktemp -d)
cd "$DIR"

echo ":: Fetching the newest proton-cachyos version"

URL_SUFFIX=$(curl -s https://packages.cachyos.org/package/cachyos/x86_64/proton-cachyos | grep -oP 'proton-cachyos-[^"]+\.pkg\.tar\.zst' | sort -V | head -n1)

URL="https://cdn77.cachyos.org/repo/x86_64/cachyos/$URL_SUFFIX"

echo ":: Checking for updates"

if [ "$URL" = "$URL_CACHED" ] && pacman -Q proton-cachyos &>/dev/null; then
    echo "  No new proton-cachyos version detected"
    rm -r "$DIR"
    exit
fi

echo ":: Downloading the newest proton-cachyos version"

curl "$URL" --output proton-cachyos.pkg.tar.zst 

echo ":: Installing the downloaded proton-cachyos version"

pacman -U proton-cachyos.pkg.tar.zst --needed || true

echo ":: Updating cache"

echo "$URL" > "/usr/share/proton-update/url"

echo ":: Cleaning up"

rm -r proton-cachyos.pkg.tar.zst
rm -r "$DIR"
