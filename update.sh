#!/bin/bash

VERSION=$1

set -e
sed -re -i "s/^pkgver=.*$/pkgver=$VERSION/" PKGBUILD

set +e
makepkg -si
set -e

checksum=$(sha256sum $VERSION.tar.gz | awk '{print $1}')

sed -re -i "s/^sha256sums=.*$/sha256sums=$checksum/" PKGBUILD

makepkg -si

sudo systemctl status home-assistant

echo "Sleep 60sec to ensure everything is working good"

sleep 60
sudo systemctl is-active home-assistant

makepkg --printsrcinfo > .SRCINFO

echo "You simply have to commit+push the changes"
