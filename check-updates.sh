#!/usr/bin/env bash

set -euo pipefail

readonly PKGBUILD_FILE="${1:-PKGBUILD}"
readonly UPDATE_YML_URL="https://software.lenzaos.com/app-chats/latest-linux.yml"

if [[ ! -f "${PKGBUILD_FILE}" ]]; then
  echo "error: file not found: ${PKGBUILD_FILE}" >&2
  exit 1
fi

current_version="$(awk -F= '/^pkgver=/{print $2; exit}' "${PKGBUILD_FILE}")"
if [[ -z "${current_version}" ]]; then
  echo "error: failed to read pkgver from ${PKGBUILD_FILE}" >&2
  exit 1
fi

if ! latest_yml="$(curl -fsSL "${UPDATE_YML_URL}")"; then
  echo "error: failed to fetch ${UPDATE_YML_URL}" >&2
  exit 2
fi

latest_version="$(
  printf '%s\n' "${latest_yml}" \
    | awk -F': ' '/^version:/{print $2; exit}' \
    | tr -d '\r'
)"

if [[ -z "${latest_version}" ]]; then
  echo "error: failed to read version from ${UPDATE_YML_URL}" >&2
  exit 1
fi

if [[ "${current_version}" == "${latest_version}" ]]; then
  echo "up-to-date: ${current_version}"
  exit 0
fi

echo "update available: ${current_version} -> ${latest_version}"
exit 10
