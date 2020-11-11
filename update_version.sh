#!/bin/bash
set -euxo pipefail

obs_version=$(curl -sSfL "https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/obs-studio" | awk -F '=' '/^pkgver=/{print $2}')
sink_version=$(curl -sSfL "https://lv.luzifer.io/catalog-api/obs-v4l2sink/latest.txt?p=version")

[ -n "${obs_version}" ] && [ -n "${sink_version}" ] || {
	echo "Unable to find current versions"
	exit 1
}

# First update OBS version
grep -q "^_obsver=${obs_version}$" PKGBUILD || {
	pkgrel=$(($(awk -F '=' '/^pkgrel=/{print $2}' PKGBUILD) + 1))
	sed -i \
		-e "s/^_obsver=.*/_obsver=${obs_version}/" \
		-e "s/pkgrel=.*/pkgrel=${pkgrel}/" \
		PKGBUILD
}

# In case there is a release, update the release version
grep -q "^pkgver=${sink_version}$" PKGBUILD ||
	sed -i \
		-e "s/^pkgver=.*/pkgver=${sink_version}/" \
		-e 's/pkgrel=.*/pkgrel=1/' \
		PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
	echo "Package has most recent version ${sink_version} and OBS version ${obs_version}"
	exit 0
fi

updpkgsums

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "obs-v4l2sink v${sink_version} / obs-studio v${obs_version}"
