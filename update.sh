#!/bin/bash
# Licensed under the MIT License <http://opensource.org/licenses/MIT>.
# SPDX-License-Identifier: MIT
# Author: Suren <dev at behnamlal dot xyz>
#
# Bumps pkgver in the PKGBUILD to the latest oda-file-converter release,
# refreshes checksums and .SRCINFO, builds, and commits.
#
# The download page only links an unversioned file name
# (ODAFileConverter_QT6_lnxX64_11dll.deb); the server answers it with a
# redirect to the real, versioned file, which is where the version is read from.
#
# dependencies: curl, pacman-contrib, git, makepkg

set -euo pipefail

base="https://www.opendesign.com/guestfiles"

# Discover the current "<qt/dll tag>" from the download page (e.g. QT6_lnxX64_11dll)
tag=$(curl -fsS "$base/oda_file_converter" \
    | grep -oP '(?<=filename=)ODAFileConverter_\K[\w.-]+?dll(?=\.deb)' | head -n 1)
if [ -z "$tag" ]; then
    echo "Could not find the .deb link on the download page" >&2
    exit 1
fi

# The unversioned name 301-redirects to the versioned file; read the version off it
location=$(curl -sI "$base/get?filename=ODAFileConverter_${tag}.deb" \
    | grep -i '^location:' | tr -d '\r')
latest_version=$(echo "$location" | grep -oP "(?<=ODAFileConverter_${tag}_)[0-9]+(\.[0-9]+)*(?=\.deb)" | head -n 1)
if [ -z "$latest_version" ]; then
    echo "Could not determine the latest version (redirect: $location)" >&2
    exit 1
fi

old_version=$(grep -oP '(?<=^pkgver=).*' ./PKGBUILD)

echo "Latest oda-file-converter version: $latest_version (current: $old_version)"

if [ "$latest_version" = "$old_version" ] && grep -q "ODAFileConverter_${tag}_" PKGBUILD; then
    echo "No updates found!"
    exit 0
fi

sed -i "s#^pkgver=.*#pkgver=${latest_version}#" ./PKGBUILD
sed -i "s#^pkgrel=.*#pkgrel=1#" ./PKGBUILD
# keep the file name / tag in the source URL in sync with the page
sed -i -E "s#ODAFileConverter_[A-Za-z0-9_.-]*dll_#ODAFileConverter_${tag}_#g" ./PKGBUILD

if ! pacman -Qi pacman-contrib > /dev/null 2>&1; then
    echo "Install pacman-contrib with 'pacman -S pacman-contrib'" >&2
    exit 1
fi

updpkgsums
makepkg --printsrcinfo > .SRCINFO
makepkg -f

git add PKGBUILD .SRCINFO
git commit -m "$old_version -> $latest_version : Upgrade package"

# git push origin master
