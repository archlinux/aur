#!/usr/bin/env bash
set -eu -o pipefail

cd "$(dirname "${0}")"
source PKGBUILD

_latest="$(
  curl -s -o /dev/null -w '%{json}' "${_url_base}-latest.tar.gz" \
    | jq -r '.redirect_url' \
    | sed -E 's/.*SDK-(.*)\.tar\.gz/\1/'
)"

if [ "${_latest}" != "${pkgver}" ]
then
  echo >&2 "${pkgname}: AUR ${pkgver} != upstream ${_latest}"
  exit 1
fi

echo >&2 "${pkgname}: AUR ${pkgver} == upstream ${_latest}"
