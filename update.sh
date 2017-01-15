#!/bin/bash

VERSION=$1

set -e
sed -i -re "s/^pkgver=.*$/pkgver=$VERSION/" PKGBUILD
# Reset release to 1
sed -i -re "s/^pkgrel=.*$/pkgrel=1/" PKGBUILD

set +e
makepkg -s
set -e

updpkgsums

makepkg -si

sudo systemctl --no-pager status home-assistant

echo "Sleep 60sec to ensure everything is working good"

for i in {1..12}; do echo -n . ; sleep 5 ; done
sudo systemctl --no-pager status home-assistant

makepkg --printsrcinfo > .SRCINFO

echo "You simply have to commit+push the changes"
