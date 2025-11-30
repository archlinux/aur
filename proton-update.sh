#!/bin/bash
set -e

CYAN='\033[0;36m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
MAGENTA='\033[0;35m'
BLUE='\033[0;34m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
    echo -e "  ${RED}Error::${YELLOW} This script must be run with sudo or as root.${NC}"
    exit 1
fi

LINE="IgnorePkg = proton-cachyos"
FILE="/etc/pacman.conf"

if ! grep -Fxq "$LINE" "$FILE"; then
    echo -e "${YELLOW}::${NC} Adding ${MAGENTA}"$LINE" ${NC}to ${MAGENTA}$FILE${NC} ${YELLOW}!${NC}"
    echo "[options]" | tee -a "$FILE" > /dev/null
    echo "$LINE" | tee -a "$FILE" > /dev/null
fi

mkdir -p /usr/share/proton-update

if [ ! -f "/usr/share/proton-update/url" ]; then
    touch "/usr/share/proton-update/url"
fi

echo -e "${CYAN}:: ${NC}Fetching cached proton-cachyos version"

URL_CACHED=$(cat "/usr/share/proton-update/url")

echo -e "${CYAN}:: ${NC}Changing to temporal directory"

DIR=$(mktemp -d)
cd "$DIR"

echo -e "${CYAN}:: ${NC}Fetching the newest proton-cachyos version"

URL_SUFFIX=$(curl -s https://packages.cachyos.org/package/cachyos/x86_64/proton-cachyos | grep -oP 'proton-cachyos-[^"]+\.pkg\.tar\.zst' | sort -V | head -n1)

URL="https://cdn77.cachyos.org/repo/x86_64/cachyos/$URL_SUFFIX"

echo -e "${CYAN}:: ${NC}Checking for updates"

if [ "$URL" = "$URL_CACHED" ] && pacman -Q proton-cachyos &>/dev/null; then
    echo -e "  ${BLUE}No new proton-cachyos version detected${NC}"
    rm -r "$DIR"
    exit
fi

echo -e "${CYAN}:: ${NC}Downloading the newest proton-cachyos version"

curl "$URL" --output proton-cachyos.pkg.tar.zst 

echo -e "${CYAN}:: ${NC}Installing the downloaded proton-cachyos version"

pacman -U proton-cachyos.pkg.tar.zst --needed || true

echo -e "${CYAN}:: ${NC}Updating cache"

echo "$URL" > "/usr/share/proton-update/url"

echo -e "${CYAN}:: ${NC}Cleaning up"

rm -r proton-cachyos.pkg.tar.zst
rm -r "$DIR"
