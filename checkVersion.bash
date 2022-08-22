#!/bin/bash
# This is a not very elaborate script to check the version of Discover in the
# official repositories and the AUR version. It assumes discover-snap is
# installed on the system.
ARCHVERSION=`curl -s https://archlinux.org/packages/extra/x86_64/discover/ | grep -oP '(?<=<meta itemprop="softwareVersion" content=\").*?(?=\"/>)'`
AURVERSION=`LC_ALL=C pacman -Qi discover-snap | grep -oP '(?<=Version         : )([0-9,\.\-])*'`
echo "Arch (discover) version is ${ARCHVERSION}."
echo "AUR (discover-snap) version is ${AURVERSION}."
