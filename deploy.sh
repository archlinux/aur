#!/usr/bin/sh

VERSION=$(curl -s "https://api.github.com/repos/nate-craft/auditorium/releases/latest" | jq -r .tag_name)
BIN_NAME="auditorium-minimal-v${VERSION}-linux-amd64"
CHECKSUM=$(curl -Ls "https://github.com/nate-craft/auditorium/releases/download/${VERSION}/${BIN_NAME}" | sha256sum | cut -d ' ' -f1)

sed -i "s/^pkgver=.*/pkgver=${VERSION}/" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=(\"${CHECKSUM}\")/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
git init
git add .
git commit -m "Version $VERSION"
if ! git remote get-url aur > /dev/null 2>&1; then
    git remote add aur ssh://aur@aur.archlinux.org/auditorium-minimal.git
fi
git fetch aur
git push --set-upstream aur master

printf "Attempted upload of %s\n" "$BIN_NAME"
