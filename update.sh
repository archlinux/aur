#!/bin/bash -e
# Update lx-music-desktop by script

SELF_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "${SELF_DIR}/PKGBUILD"
echo "Current version: ${pkgver}"
echo -n "Checking latest version... "
LATEST_VER="$(curl -si https://mirror.ghproxy.com/https://github.com/lyswhut/lx-music-desktop/releases/latest | sed -nr 's@^location:.*/v(.*)\r@\1@p')"
echo "${LATEST_VER}"

if [ "${LATEST_VER}" = ${pkgver} ]; then
    echo "Update to date."
    exit
else
    FILE_NAME="lx-music-desktop_${LATEST_VER}_x64.pacman"
    LATEST_DOWNLOAD_URL="https://mirror.ghproxy.com/https://github.com/lyswhut/lx-music-desktop/releases/download/v${LATEST_VER}/${FILE_NAME}"
    echo -n "Calculating lx-music-desktop ${LATEST_VER} md5sum... "
    curl -ksSLo "/tmp/${FILE_NAME}" -C- "${LATEST_DOWNLOAD_URL}"
    MD5="$(md5sum "/tmp/${FILE_NAME}" | cut -d' ' -f1)"
    echo "${MD5}"
    echo -n "Updating PKGBUILD... "
    tar xf "/tmp/${FILE_NAME}" .INSTALL && mv -f .INSTALL "${SELF_DIR}/lx-music-desktop.install"
    sed -i "s/^pkgver=.*/pkgver=${LATEST_VER}/;s/^md5sums=.*/md5sums=('${MD5}')/" "${SELF_DIR}/PKGBUILD"
    echo "Done"
    echo "Test building locally"
    cd "${SELF_DIR}"
    makepkg -sf
    echo "Success."
    echo -n "Refresh .SRCINFO... "
    makepkg --printsrcinfo >.SRCINFO
    echo "Done"
    echo -n "Add git commit... "
    git commit -qam "Upgrade to ${LATEST_VER}"
    echo "Done"
    echo "All done. Please use git push to update AUR."
fi
