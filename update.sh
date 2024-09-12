#!/usr/bin/env bash
set -euo pipefail

# TODO: Fetch latest discord version
discordUrl="$(curl -o /dev/null -LsI -w '%{url_effective}' 'https://discord.com/api/download?platform=linux&format=tar.gz')"
discordVersion="$(echo "$discordUrl" | grep -o '[0-9]*\.[0-9]*\.[0-9]*' | head -n1)"
# TODO: Fetch latest electron version

# Update pkgver
pushd "src/openasar"
pkgver=$(printf "%s+%s.%s" "$discordVersion" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
popd
sed -i "s/^pkgver=.*/pkgver=$pkgver/" PKGBUILD

# Update checksums
updpkgsums

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO
