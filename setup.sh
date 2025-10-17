#!/usr/bin/sh

VERSION=$(curl -s "https://api.github.com/repos/nate-craft/auditorium/releases/latest" | jq -r .tag_name)
BIN_NAME="auditorium-v${VERSION}-linux-amd64"
CHECKSUM=$(curl -Ls "https://github.com/nate-craft/auditorium/releases/download/${VERSION}/${BIN_NAME}" | sha256sum | cut -d ' ' -f1)

sed -i "s/^pkgver=.*/pkgver=${VERSION}/" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=(\"${CHECKSUM}\")/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "Version $VERSION"
git fetch aur
git push --set-upstream aur master

printf "Attempted upload of %s\n" "$BIN_NAME"
