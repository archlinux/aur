#!/usr/bin/env bash

#
# This script is used to test AUR builds locally in a clean Arch Linux Docker container.
# It is not used in the AUR builds in any way, and is only for debugging purposes.
#

set -e

# Determine the current versions and if we should build or not
aurversion=$(grep pkgver .SRCINFO | awk -F= '{print $2}' | sed -e 's/ //g')
githubversion=$(curl https://api.github.com/repos/ferdium/ferdium-app/releases 2>/dev/null| jq -r 'map(select(.prerelease == false)) | first | .name')

# Convert versions to AUR friendly names
newpkgverorg="$(echo -n "${githubversion}" | sed 's/^v//')"
newpkgver="$(echo -n "${newpkgverorg}" | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"

echo "Current AUR version: [${aurversion}]"
echo "Current GitHub version: [${githubversion}]"
echo "Future AUR version: [${newpkgver}]"

if [ "${aurversion}" = "${newpkgver}" ]
then
	echo -n "Versions are identical, if you wish to build anyway, press Enter, otherwise press Ctrl-C now: "
	read foo
	echo "Okay, here we go! Creating the build script..."
fi

# Start the build
cat << EOF > tempscript.sh
set -e

# System set-up
pacman-key --init
pacman -Sy archlinux-keyring --noconfirm
pacman -Syu --noconfirm
pacman -S pacman-contrib git openssh --noconfirm
echo 'yay ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
useradd -d /home/yay -g users -m -s /bin/bash yay

# Build the package
cd /tmp
sudo -u yay git clone https://aur@aur.archlinux.org/ferdium-bin.git
cd /tmp/ferdium-bin
EOF
cat << 'EOF' >> tempscript.sh
sed -i -e "s/^pkgverorg=.*/pkgverorg='${newpkgverorg}'/g" PKGBUILD
sed -i -e "s/^pkgver=.*/pkgver='${newpkgver}'/g" PKGBUILD
EOF
cat << EOF >> tempscript.sh
sudo -u yay updpkgsums
sudo -u yay makepkg -s --noconfirm
sudo -u yay makepkg --printsrcinfo > .SRCINFO
EOF

echo "Starting docker container with the build script..."

docker run --rm -e newpkgverorg=${newpkgverorg} -e newpkgver=${newpkgver} -v $(pwd)/tempscript.sh:/root/tempscript.sh archlinux:base-devel /bin/bash /root/tempscript.sh

echo "Cleaning up..."
rm -rf tempscript.sh
