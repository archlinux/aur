#!/usr/bin/env bash
set -e

cd $(dirname "${0}")

PKG=$(cat .SRCINFO | grep "pkgbase" | head -n1 | awk '{print $3}')
CURRENT=$(cat .SRCINFO | grep "pkgver" | head -n1 | awk '{print $3}')
LATEST=$(curl --silent 'https://git.kernel.org/pub/scm/network/ofono/ofono.git/info/refs' | grep "refs/tags" | grep -F -v "^{}" | awk -F'/' '{print $3}' | sort --version-sort | tail -n1)
if [ "${LATEST}" != "${CURRENT}" ]
then
  echo "${PKG} : AUR ${CURRENT} != Upstream ${LATEST}"
  exit 1
fi
echo "${PKG} : AUR ${CURRENT} == Upstream ${LATEST}"
exit 0
