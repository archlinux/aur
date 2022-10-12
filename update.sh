#!/bin/bash
read -r LOCALVER <<<"$(cat PKGBUILD | grep 'pkgver=' | sed 's/pkgver=//g')"
read -r UPSTREAMVER <<<"$(wget --quiet https://www.npmjs.com/package/markmap-cli/v/latest -O /dev/stdout | grep -Eo '[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}<!-- --> • ' | head -1 | sed 's/<.*//g')"

if [ "$LOCALVER" == "$UPSTREAMVER" ]; then
	echo "No update available"
	exit 0
fi

echo "New version available: $UPSTREAMVER"
if [[ $* == *--dry-run* ]]; then
	exit 0
fi

sed -i "s/pkgver=.*/pkgver=$UPSTREAMVER/g" PKGBUILD
echo "Updated version to $UPSTREAMVER"

updpkgsums
makepkg --printsrcinfo >.SRCINFO
git add ./PKGBUILD ./.SRCINFO
git commit -m "Version $UPSTREAMVER"
git push && git push aur master
