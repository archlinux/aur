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
else
	# Replace with latest commit to master branch
	LATEST_COMMIT=$(git ls-remote "$url" master | cut -f 1)
	if [ "$commit" = "$LATEST_COMMIT" ]
	then
		echo "Already on latest commit!"
		exit 3
	fi
	sed -i "s|commit\=.*|commit\=('$LATEST_COMMIT')|" "$BUILD_FILE"

	# Update package checksum
	PKG_SHA=$(curl -L -s "$url/archive/$LATEST_COMMIT.tar.gz" | sha256sum | cut -d " " -f 1)
	sed -i "s|sha256sums\=.*|sha256sums\=('$PKG_SHA')|" "$BUILD_FILE"
fi

# Increment pkgrel on every "release"
sed -i "s|pkgrel\=.*|pkgrel\=$((pkgrel+1))|" "$BUILD_FILE"

makepkg --printsrcinfo > .SRCINFO
