#!/usr/bin/env bash

if [ ! -d ".git" ]
then
	echo "Not a git repository!"
	exit 1
fi

BUILD_FILE="PKGBUILD"
if [ ! -e "$BUILD_FILE" ]
then
	echo "Not an AUR repository!"
	exit 2
fi
source "$BUILD_FILE"

if [ "$1" == "--aur-only" ]
then
	echo "Only updating \$pkgrel!"
	sed -i "s|pkgrel\=.*|pkgrel\=$((pkgrel+1))|" "$BUILD_FILE"
else
	sed -i "s|pkgrel\=.*|pkgrel\=1|" "$BUILD_FILE"
	# Have makepkg update the version using pkgver()
	makepkg --nodeps --nobuild
fi

makepkg --printsrcinfo > .SRCINFO
