#!/usr/bin/env bash
set -euo pipefail

PKGBUILD_PATH="${1:-PKGBUILD}"
if [[ "${PKGBUILD_PATH}" == "-h" || "${PKGBUILD_PATH}" == "--help" ]]; then
  echo "Usage: $0 [PKGBUILD-path]" >&2
  exit 0
fi

if [[ ! -f "${PKGBUILD_PATH}" ]]; then
  echo "Error: PKGBUILD file not found at '${PKGBUILD_PATH}'" >&2
  exit 1
fi

extract_value() {
  local key="$1"
  sed -nE "s/^${key}=['\"]?([^'\"#]+).*/\1/p" "${PKGBUILD_PATH}" | head -n1
}

fetch_upstream_ver() {
  # Fetch the install script and extract the version string like 2025.08.09-d8191f3
  local install_content
  if ! install_content="$(curl -fsSL "https://cursor.com/install")"; then
    echo "Error: failed to fetch install script" >&2
    return 1
  fi
  # Look for patterns used in DOWNLOAD_URL or TEMP_EXTRACT_DIR or FINAL_DIR
  # e.g., downloads.cursor.com/lab/2025.08.09-d8191f3/linux/x64/agent-cli-package.tar.gz
  local found
  found="$(grep -Eo 'downloads\.cursor\.com/lab/([0-9]{4}\.[0-9]{2}\.[0-9]{2}-[A-Za-z0-9]+)' <<<"${install_content}" | head -n1 | sed -E 's@.*lab/([^/]+).*@\1@')"
  if [[ -z "${found}" ]]; then
    # Fallback: search for versions path in FINAL_DIR lines
    found="$(grep -Eo 'versions/([0-9]{4}\.[0-9]{2}\.[0-9]{2}-[A-Za-z0-9]+)' <<<"${install_content}" | head -n1 | sed -E 's@versions/@@')"
  fi
  if [[ -z "${found}" ]]; then
    echo "Error: could not parse upstream version from install script" >&2
    return 1
  fi
  echo "${found}"
}

CURRENT_PKGVER="$(extract_value "pkgver")"
UPSTREAM_VER_NEW="$(fetch_upstream_ver)"

if [[ -z "${UPSTREAM_VER_NEW}" || -z "${CURRENT_PKGVER}" ]]; then
  echo "Error: Could not obtain upstream version or parse pkgver from '${PKGBUILD_PATH}'" >&2
  exit 1
fi

# Parse upstream version: YYYY.MM.DD-<id>
if [[ "${UPSTREAM_VER_NEW}" =~ ^([0-9]{4}\.[0-9]{2}\.[0-9]{2})[.-](.+)$ ]]; then
  release_date_dotted="${BASH_REMATCH[1]}"
  rest="${BASH_REMATCH[2]}"
else
  echo "Error: upstream version '${UPSTREAM_VER_NEW}' does not start with YYYY.MM.DD" >&2
  exit 1
fi

# Take the last dot-separated token after the date as the hash-like id
if [[ "${rest}" == *.* ]]; then
  new_hash="${rest##*.}"
else
  new_hash="${rest}"
fi
new_hash="${new_hash//-/.}"

# Expect current pkgver in the form: YYYY.MM.DD.DATE_VER.HASH
if [[ "${CURRENT_PKGVER}" =~ ^([0-9]{4}\.[0-9]{2}\.[0-9]{2})\.([0-9]+)\.([A-Za-z0-9\.]+)$ ]]; then
  prev_date="${BASH_REMATCH[1]}"
  prev_date_ver="${BASH_REMATCH[2]}"
  prev_hash="${BASH_REMATCH[3]}"
else
  echo "Error: current pkgver='${CURRENT_PKGVER}' invalid; expected YYYY.MM.DD.DATE_VER.HASH" >&2
  exit 1
fi

if [[ "${release_date_dotted}" == "${prev_date}" ]]; then
  if [[ "${new_hash}" != "${prev_hash}" ]]; then
    new_date_ver="$((prev_date_ver + 1))"
  else
    new_date_ver="${prev_date_ver}"
  fi
else
  new_date_ver="1"
fi

NEW_PKGVER="${release_date_dotted}.${new_date_ver}.${new_hash}"

# Update _upstream_ver first if needed
CURRENT_UPSTREAM_VER_IN_FILE="$(extract_value "_upstream_ver")"
if [[ -z "${CURRENT_UPSTREAM_VER_IN_FILE}" ]]; then
  echo "Error: '_upstream_ver' not found in '${PKGBUILD_PATH}'" >&2
  exit 1
fi

file_backup="$(mktemp)"
cp -f -- "${PKGBUILD_PATH}" "${file_backup}"
if [[ "${CURRENT_UPSTREAM_VER_IN_FILE}" != "${UPSTREAM_VER_NEW}" ]]; then
  sed -i -E "s/^_upstream_ver=.*/_upstream_ver='${UPSTREAM_VER_NEW}'/" "${PKGBUILD_PATH}"
fi

if [[ "${NEW_PKGVER}" != "${CURRENT_PKGVER}" ]]; then
  if ! sed -i -E "s/^pkgver=.*/pkgver=${NEW_PKGVER}/" "${PKGBUILD_PATH}"; then
    echo "Error: failed to update pkgver in '${PKGBUILD_PATH}'" >&2
    mv -f -- "${file_backup}" "${PKGBUILD_PATH}"
    exit 1
  fi
fi
rm -f -- "${file_backup}"
echo "${NEW_PKGVER}"
