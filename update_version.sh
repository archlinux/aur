#!/bin/bash

set -e
. /usr/share/makepkg/util/util.sh

warning "This script calls out to papermc's API to determine the latest"
warning "version and build number. Press Ctrl+C within 2 seconds to abort."
sleep 2

mcver=$(curl -s "https://papermc.io/api/v2/projects/waterfall" | jq -r '.version_groups[-1]')

if ! [[ "$mcver" =~ ^1\.[0-9]{2}$ ]]; then
	error "Minecraft version doesn't seem sensible: $mcver"
	exit 1
fi

build=$(curl -s "https://papermc.io/api/v2/projects/waterfall/versions/${mcver}" | jq -r '.builds[-1]')

if ! [[ "$build" =~ ^[0-9]{3,5}$ ]]; then
	error "Build number doesn't seem sensible: $build"
	exit 1
fi

msg "Using minecraft version: ${mcver} / waterfall build: ${build}"

sed -re "/^_mcver=/ c _mcver=${mcver}" -e "/^_build=/ c _build=${build}" -i PKGBUILD

# delete sha256sums, but leave a placeholder as a hint to use sha256 and not md5
sed -zre "s;sha256sums=\('([a-f0-9]{64}|SKIP)'(\n *'([a-f0-9]{64}|SKIP)')*\);sha256sums=('SKIP');g" -i PKGBUILD

makepkg -g >> PKGBUILD
sed -re "/^sha256sums=\('SKIP'\)$/ d" -i PKGBUILD

makepkg --printsrcinfo > .SRCINFO
