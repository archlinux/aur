#!/bin/bash
# Licensed under the MIT License <http://opensource.org/licenses/MIT>.
# SPDX-License-Identifier: MIT
# Author: Suren <dev at behnamlal dot xyz>
#
# This script updates the PKGBUILD file to the latest version of oda-file-converter
# and commits the changes to the repository.
#
# dependencies: curl, pacman-contrib, git, makepkg,


# Retrieve the webpage using curl
webpage=$(curl -s "https://www.opendesign.com/guestfiles/oda_file_converter")
deb_line=$(echo "$webpage" | grep -oP '/guestfiles/get\?filename=ODAFileConverter_QT6_lnxX64_[\w\.-]+dll_[\w\.-]+\.deb' | head -n 1)
deb_url=$(echo "https://www.opendesign.com$deb_line")

# extract version from url by checking the digits before the .deb extension and after underscore
# e.g. 8.3dll_24.4.deb -> 24.4
latest_version=$(echo "$deb_url" | grep -oP '(?<=_)[0-9.]+(?=\.deb)')

old_version=$(grep -oP '(?<=^pkgver=).*' ./PKGBUILD)

echo "Latest oda-file-converter version: $latest_version"

sed -i "s#^pkgver=.*#pkgver=${latest_version}#" ./PKGBUILD

# add file name to the source array before the deb url
file_name=$(echo "$deb_url" | grep -oP '(?<=filename=)[\w\.-]+\.deb')
deb_url="${file_name}::${deb_url}"

sed -i "s#^source=.*#source=(\'${deb_url}\'#" ./PKGBUILD

if ! git diff --quiet HEAD PKGBUILD; then

	if pacman -Qi pacman-contrib > /dev/null 2>&1; then
		updpkgsums
	else
		echo "Install pacman-contrib with 'pacman -S pacman-contrib'"
		exit 1
	fi

	makepkg --printsrcinfo > .SRCINFO

	makepkg

	git add PKGBUILD .SRCINFO

	# Read the PKGBUILD file and extract the maintainer's name and contact information
	maintainer_line=$(grep -m1 '^# Maintainer:' PKGBUILD)
	maintainer=${maintainer_line##*Maintainer:}
	# Trim leading and trailing whitespace from the maintainer's name
	maintainer=$(echo "$maintainer" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

	git commit -m "$old_version -> $latest_version : Upgrade package

	This commit upgrades the package from version $old_version to $latest_version. This upgrade ensures that users have access to the latest version with the most up-to-date functionality.

	Signed-off-by: $maintainer"

	# git push origin master

else
	echo "No updates found!"
fi
