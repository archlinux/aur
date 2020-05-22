#!/bin/bash

set -e

source PKGBUILD
V=$(curl --silent "https://api.github.com/repos/jitsi/jitsi-meet/tags" | jq -r '[.[]|select(.name|startswith("stable/jitsi-meet_"))|.name][0][18:]')

echo "VERSION=$_stable_version REMOTE=$V"

if [ "$_stable_version" -ne "$V" ]
then
	echo "Updating ..."
	sed -i "s@^_stable_version=.*@_stable_version=$V@; s@pkgrel=.*@pkgrel=1@" PKGBUILD
fi
updpkgsums
makepkg --printsrcinfo > .SRCINFO
