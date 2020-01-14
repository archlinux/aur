#!/usr/bin/env bash
set -e

cd $(dirname "${0}")

CRATE="cargo-asm"

PKG=$(cat .SRCINFO | grep "pkgbase" | head -n1 | awk '{print $3}')
CURRENT=$(cat .SRCINFO | grep "pkgver" | head -n1 | awk '{print $3}')
LATEST=$(curl --silent -L "https://crates.io/api/v1/crates/${CRATE}" | jq -r '.crate.newest_version')
if [ "${LATEST}" != "${CURRENT}" ]
then
  echo "${PKG} : AUR ${CURRENT} != Cargo ${LATEST}"
  exit 1
fi
echo "${PKG} : AUR ${CURRENT} == Cargo ${LATEST}"
exit 0
