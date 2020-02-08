#!/usr/bin/env bash
set -e

cd $(dirname "${0}")

REPOSITORY="moby/buildkit"

PKG=$(cat .SRCINFO | grep "pkgbase" | head -n1 | awk '{print $3}')
CURRENT=$(cat .SRCINFO | grep "pkgver" | head -n1 | awk '{print $3}')
LATEST=$(curl -n --silent -L "https://api.github.com/repos/${REPOSITORY}/releases/latest" | jq -r '.tag_name' | sed 's/^v//g')
if [ "${LATEST}" != "${CURRENT}" ]
then
  echo "${PKG} : AUR ${CURRENT} != GitHub ${LATEST}"
  exit 1
fi
echo "${PKG} : AUR ${CURRENT} == GitHub ${LATEST}"
exit 0
