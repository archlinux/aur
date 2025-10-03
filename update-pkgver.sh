#!/usr/bin/env bash
set -euo pipefail

PKGBUILD_PATH="${1:-PKGBUILD}"
[[ ! -f "${PKGBUILD_PATH}" ]] && { echo "Error: PKGBUILD file not found at '${PKGBUILD_PATH}'" >&2; exit 1; }

CURRENT_PKGVER="$(sed -nE "s/^pkgver=['\"]?([^'\"#]+).*/\1/p" "${PKGBUILD_PATH}" | head -n1)"
UPSTREAM_VER_NEW="$(curl -fsSL "https://cursor.com/install" | grep -Eo 'downloads\.cursor\.com/lab/([0-9]{4}\.[0-9]{2}\.[0-9]{2}-[A-Za-z0-9]+)' | head -n1 | sed -E 's@.*lab/([^/]+).*@\1@')"

[[ -z "${UPSTREAM_VER_NEW}" || -z "${CURRENT_PKGVER}" ]] && { echo "Error: Could not obtain upstream version or parse pkgver from '${PKGBUILD_PATH}'" >&2; exit 1; }

# Parse upstream version: YYYY.MM.DD-<id>
[[ "${UPSTREAM_VER_NEW}" =~ ^([0-9]{4}\.[0-9]{2}\.[0-9]{2})[.-](.+)$ ]] || { echo "Error: upstream version '${UPSTREAM_VER_NEW}' does not start with YYYY.MM.DD" >&2; exit 1; }
release_date_dotted="${BASH_REMATCH[1]}"
rest="${BASH_REMATCH[2]}"

new_hash="${rest##*.}"
new_hash="${new_hash//-/.}"

# Expect current pkgver in the form: YYYY.MM.DD.DATE_VER.HASH
[[ "${CURRENT_PKGVER}" =~ ^([0-9]{4}\.[0-9]{2}\.[0-9]{2})\.([0-9]+)\.([A-Za-z0-9\.]+)$ ]] || { echo "Error: current pkgver='${CURRENT_PKGVER}' invalid; expected YYYY.MM.DD.DATE_VER.HASH" >&2; exit 1; }
prev_date="${BASH_REMATCH[1]}"
prev_date_ver="${BASH_REMATCH[2]}"
prev_hash="${BASH_REMATCH[3]}"

if [[ "${release_date_dotted}" == "${prev_date}" ]]; then
  [[ "${new_hash}" != "${prev_hash}" ]] && new_date_ver="$((prev_date_ver + 1))" || new_date_ver="${prev_date_ver}"
else
  new_date_ver="1"
fi

NEW_PKGVER="${release_date_dotted}.${new_date_ver}.${new_hash}"

sed -i -E "s/^_upstream_ver=.*/_upstream_ver='${UPSTREAM_VER_NEW}'/" "${PKGBUILD_PATH}"
sed -i -E "s/^pkgver=.*/pkgver=${NEW_PKGVER}/" "${PKGBUILD_PATH}"
[[ "${NEW_PKGVER}" != "${CURRENT_PKGVER}" ]] && sed -i -E "s/^pkgrel=.*/pkgrel=1/" "${PKGBUILD_PATH}"

echo "${NEW_PKGVER}"
