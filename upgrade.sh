#!/bin/bash
# author: amF6enRpY2tldHNAZ21haWwuY29tCg==

# get new version
pacman -Q | grep sqlite
echo "Enter new version: "
read -r version

# check version
if [ -z "$version" ]; then
	echo "No version specified"
	exit 1
fi

# get download url
url_version="${version/\./}"
url_version="${url_version/\./0}00"
url="https://www.sqlite.org/2023/sqlite-autoconf-${url_version}.tar.gz"
echo "$url"

# download source
if ! wget "$url"; then
	echo "Failed to download new version!"
	exit 1
fi

# get checksum
checksum=$(sha256sum sqlite-autoconf-*.tar.gz | cut -f1 -d ' ')
if [ -z "$checksum" ]; then
	echo "Bad sha256sum!"
	exit 1
fi

echo "$checksum"

# update PKGBUILD
sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD
sed -i "s/_amalgamationver=.*/_amalgamationver=$url_version/" PKGBUILD
sed -i "s/sha256sums=(.*)/sha256sums=('$checksum')/" PKGBUILD

# build
makepkg --printsrcinfo > .SRCINFO
makepkg -s
