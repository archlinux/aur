#!/usr/bin/env bash
set -euo pipefail

PKGBUILD_PATH="${1:-PKGBUILD}"
[[ ! -f "${PKGBUILD_PATH}" ]] && { echo "Error: PKGBUILD file not found at '${PKGBUILD_PATH}'" >&2; exit 1; }
PKGBUILD_DIR="$(cd "$(dirname "${PKGBUILD_PATH}")" && pwd)"

CURRENT_PKGVER="$(sed -nE "s/^pkgver=['\"]?([^'\"#]+).*/\1/p" "${PKGBUILD_PATH}" | head -n1)"
UPSTREAM_VER_NEW="$(curl -fsSL "https://cursor.com/install" | grep -Eo 'downloads\.cursor\.com/lab/([0-9]{4}\.[0-9]{2}\.[0-9]{2}-[A-Za-z0-9]+)' | head -n1 | sed -E 's@.*lab/([^/]+).*@\1@')"

[[ -z "${UPSTREAM_VER_NEW}" || -z "${CURRENT_PKGVER}" ]] && { echo "Error: Could not obtain upstream version or parse pkgver from '${PKGBUILD_PATH}'" >&2; exit 1; }

# Parse upstream version: YYYY.MM.DD-<id>
[[ "${UPSTREAM_VER_NEW}" =~ ^([0-9]{4}\.[0-9]{2}\.[0-9]{2})[.-](.+)$ ]] || { echo "Error: upstream version '${UPSTREAM_VER_NEW}' does not start with YYYY.MM.DD" >&2; exit 1; }
release_date_dotted="${BASH_REMATCH[1]}"
new_hash="${BASH_REMATCH[2]}"

# Expect current pkgver in the form: YYYY.MM.DD.DATE_VER.HASH
[[ "${CURRENT_PKGVER}" =~ ^([0-9]{4}\.[0-9]{2}\.[0-9]{2})\.([0-9]+)\.([A-Za-z0-9]+)$ ]] || { echo "Error: current pkgver='${CURRENT_PKGVER}' invalid; expected YYYY.MM.DD.DATE_VER.HASH" >&2; exit 1; }
prev_date="${BASH_REMATCH[1]}"
prev_date_ver="${BASH_REMATCH[2]}"
prev_hash="${BASH_REMATCH[3]}"

if [[ "${release_date_dotted}" == "${prev_date}" ]]; then
  [[ "${new_hash}" != "${prev_hash}" ]] && new_date_ver="$((prev_date_ver + 1))" || new_date_ver="${prev_date_ver}"
else
  new_date_ver="1"
fi

NEW_PKGVER="${release_date_dotted}.${new_date_ver}.${new_hash}"

if [[ "${NEW_PKGVER}" == "${CURRENT_PKGVER}" ]]; then
  echo "${NEW_PKGVER}"
  exit 0
fi

if ! command -v updpkgsums >/dev/null 2>&1; then
  echo "Error: updpkgsums not found; cannot refresh b2sums." >&2
  exit 1
fi
if ! command -v makepkg >/dev/null 2>&1; then
  echo "Error: makepkg not found; cannot regenerate .SRCINFO." >&2
  exit 1
fi

PKGBUILD_BACKUP="$(mktemp)"
SRCINFO_BACKUP=""
cp "${PKGBUILD_PATH}" "${PKGBUILD_BACKUP}"
if [[ -f "${PKGBUILD_DIR}/.SRCINFO" ]]; then
  SRCINFO_BACKUP="$(mktemp)"
  cp "${PKGBUILD_DIR}/.SRCINFO" "${SRCINFO_BACKUP}"
fi

restore() {
  cp "${PKGBUILD_BACKUP}" "${PKGBUILD_PATH}"
  if [[ -n "${SRCINFO_BACKUP}" ]]; then
    cp "${SRCINFO_BACKUP}" "${PKGBUILD_DIR}/.SRCINFO"
  fi
  rm -f "${PKGBUILD_BACKUP}"
  [[ -n "${SRCINFO_BACKUP}" ]] && rm -f "${SRCINFO_BACKUP}"
}

sed -i -E "s/^pkgver=.*/pkgver=${NEW_PKGVER}/" "${PKGBUILD_PATH}"
sed -i -E "s/^pkgrel=.*/pkgrel=1/" "${PKGBUILD_PATH}"

if ! (cd "${PKGBUILD_DIR}" && updpkgsums); then
  echo "Error: updpkgsums failed; PKGBUILD restored." >&2
  restore
  exit 1
fi

SRCINFO_TMP="$(mktemp)"
if ! (cd "${PKGBUILD_DIR}" && makepkg --printsrcinfo > "${SRCINFO_TMP}"); then
  echo "Error: makepkg --printsrcinfo failed; files restored." >&2
  rm -f "${SRCINFO_TMP}"
  restore
  exit 1
fi
mv "${SRCINFO_TMP}" "${PKGBUILD_DIR}/.SRCINFO"

rm -f "${PKGBUILD_BACKUP}"
[[ -n "${SRCINFO_BACKUP}" ]] && rm -f "${SRCINFO_BACKUP}"

echo "${NEW_PKGVER}"
