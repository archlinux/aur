#!/usr/bin/env bash

set -euo pipefail

script_dir=$(dirname "$(readlink -f "$0")")
download_page_url="https://www.futunn.com/download/linux"
pkgbuild_path="${script_dir}/PKGBUILD"
srcinfo_path="${script_dir}/.SRCINFO"

cd "${script_dir}"

html=$(curl -fsSL "${download_page_url}")

latest_version=$(
  printf '%s\n' "${html}" |
    grep -oE '"doc":\{"label":"Linux","version":"[0-9]+\.[0-9]+\.[0-9]+"' |
    sed -E 's/^.*"version":"([^"]+)"$/\1/' |
    sed -n '1p'
)

if [[ -z "${latest_version}" ]]; then
  printf 'Failed to determine latest version from %s\n' "${download_page_url}" >&2
  exit 1
fi

current_version=$(sed -nE 's/^pkgver=(.+)$/\1/p' "${pkgbuild_path}")

if [[ -z "${current_version}" ]]; then
  printf 'Failed to read current pkgver from %s\n' "${pkgbuild_path}" >&2
  exit 1
fi

if [[ "${latest_version}" == "${current_version}" ]]; then
  printf 'Already up to date: %s\n' "${current_version}"
  exit 0
fi

sed -i -E "s/^pkgver=.*/pkgver=${latest_version}/" "${pkgbuild_path}"

updpkgsums

makepkg --printsrcinfo >"${srcinfo_path}"

printf 'Updated pkgver: %s -> %s\n' "${current_version}" "${latest_version}"
