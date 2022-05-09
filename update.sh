#!/bin/bash
read -r DOPPLERTEXT <<<"$(doppler --version | sed 's/v//g')"
read -r GITHUBTEXT <<<"$(wget --quiet https://github.com/DopplerHQ/cli/releases/latest -O /dev/stdout | grep -Eo 'Release [0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}' | head -n 1 | sed 's/Release //g')"

if [ "$DOPPLERTEXT" == "$GITHUBTEXT" ]; then
	echo "No update available"
	exit 0
fi

echo "New version available: $GITHUBTEXT"
if [[ $* == *--dry-run* ]]; then
	exit 0
fi

sed -i "s/pkgver=.*/pkgver=$GITHUBTEXT/g" PKGBUILD
echo "Updated version to $GITHUBTEXT"

updpkgsums
makepkg --printsrcinfo >.SRCINFO
git add ./PKGBUILD ./.SRCINFO
git commit -m "Bump version to $GITHUBTEXT"
git push && git push aur master
