#!/usr/bin/env bash
set -e

cd $(dirname "${0}")

REPOSITORY="storaged-project/blivet-gui"

PKG=$(cat .SRCINFO | grep "pkgbase" | head -n1 | awk '{print $3}')
CURRENT=$(cat .SRCINFO | grep "pkgver" | head -n1 | awk '{print $3}')
LATEST=$(curl -n --silent -L "https://api.github.com/repos/${REPOSITORY}/tags" | jq -r '.[].name' | grep -E -- "^[0-9]" | head -n1 | sed 's/\-/./g')
if [ "${LATEST}" != "${CURRENT}" ]
then
  echo "${PKG} : AUR ${CURRENT} != GitHub ${LATEST}"
  exit 1
fi
echo "${PKG} : AUR ${CURRENT} == GitHub ${LATEST}"
exit 0
