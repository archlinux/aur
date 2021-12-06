#!/bin/bash
read -r DOPPLERTEXT <<<"$(doppler --version | sed 's/v//g')"
read -r GITHUBTEXT <<<"$(curl -s https://github.com/DopplerHQ/cli/releases/latest | grep -Eo '[0-9]{1,2}\.[0-9]{1,3}\.[0-9]{1,3}')"
# yes we're relying on the redirect

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
