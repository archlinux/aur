#!/bin/bash

rm appdaemon-*pkg.tar.*
rm -rf src/*
rm -rf *.tar.gz

set -e
LAST_VERSION=$(ruby -r "net/http" -r "uri" -r "json" -e 'uri = URI.parse("https://api.github.com/repos/home-assistant/appdaemon/releases"); response = Net::HTTP.get_response(uri); if response.code.to_i != 200 then puts response.code.inspect; exit(1); end; puts JSON.parse(response.body).first["name"]')

VERSION=$1
echo "Will update to ${VERSION:=$LAST_VERSION}"

sed -i -re "s/^pkgver=.*$/pkgver=$VERSION/" PKGBUILD
# Reset release to 1
sed -i -re "s/^pkgrel=.*$/pkgrel=1/" PKGBUILD

updpkgsums

makepkg --printsrcinfo > .SRCINFO

# install all dependencies
cat .SRCINFO |grep -E "\s(make)?depends" | sed -re 's/.* = (.*)(>|<|$).*/\1/' | xargs yay -S --needed --nodiffmenu --noeditmenu --nocleanmenu --noupgrademenu

makepkg -si --noconfirm

echo "Finished building package"

sudo systemctl daemon-reload
sudo systemctl restart appdaemon

sudo systemctl --no-pager status appdaemon

sudo timeout 15 journalctl -u appdaemon -f

sudo systemctl --no-pager status appdaemon

echo "You simply have to commit+push the changes"
