#!/bin/bash
set -e

VERSION=$(curl -L -s -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/SlimeVR/SlimeVR-Server/releases" | jq -c -r '.[0].name')

CURRENT_VERSION=$(grep "_tag=" PKGBUILD)
CURRENT_VERSION=${CURRENT_VERSION#*=}

echo "VERSION: ${VERSION}"
echo "CURRENT_VERSION: ${CURRENT_VERSION}"

if [ "${CURRENT_VERSION}" == "${VERSION}" ] ; then
    echo -e "\nno update needed\nexit\n"
    exit 0
fi

PKGVER=$(echo "${VERSION}" | sed 's#-#.#')
PKGVER="${PKGVER:1}"

echo "PKGVER: ${PKGVER}"

sed -E "s#(pkgver=).*#\1$PKGVER#" -i PKGBUILD
sed -E "s#(_tag=).*#\1$VERSION#" -i PKGBUILD

makepkg -sf
updpkgsums
makepkg --printsrcinfo > .SRCINFO

git commit -v -a -m "Update to ${VERSION}"

