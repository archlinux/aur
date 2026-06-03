#!/bin/bash

# script function:
#   check if there is a new version of classin available,
#   if there is, update PKGBUILD and .SRCINFO with the new version,
#   also update the sha512sums_x86_64 field in PKGBUILD by
#   downloading the new deb file to calculate the new sha512 value

# prerequisites:
#   - jq: for parsing JSON data
#   - wget: for downloading the deb file
#   - sha512sum: for calculating the sha512 checksum of the downloaded file

# script usage example:
#   ./sync_from_eeo.sh

set -euo pipefail

url="https://www.eeo.cn/sysshare/custom/download_conf.json"
pkgbuild_file="PKGBUILD"
srcinfo_file=".SRCINFO"

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: jq is required but not installed." >&2
  exit 1
fi

if ! command -v wget >/dev/null 2>&1; then
  echo "Error: wget is required but not installed." >&2
  exit 1
fi

if ! command -v sha512sum >/dev/null 2>&1; then
  echo "Error: sha512sum is required but not installed." >&2
  exit 1
fi

if [[ ! -f "$pkgbuild_file" ]]; then
  echo "Error: PKGBUILD not found in current directory." >&2
  exit 1
fi

remote_info=$(curl -fsSL "$url" | jq -r '{
  version: (.[] | select(.confName=="eeocn_linux_amd64_version") | .confValue),
  link: (.[] | select(.confName=="eeocn_linux_amd64") | .confValue)
}')

remote_version=$(echo "$remote_info" | jq -r '.version')
remote_link=$(echo "$remote_info" | jq -r '.link')

if [[ -z "$remote_version" || "$remote_version" == "null" ]]; then
  echo "Error: failed to parse remote version." >&2
  exit 1
fi

if [[ -z "$remote_link" || "$remote_link" == "null" ]]; then
  echo "Error: failed to parse remote download link." >&2
  exit 1
fi

local_version=$(grep -E '^pkgver=' "$pkgbuild_file" | head -n1 | cut -d'=' -f2-)

if [[ -z "$local_version" ]]; then
  echo "Error: failed to parse local pkgver from PKGBUILD." >&2
  exit 1
fi

echo "Remote version: $remote_version"
echo "Local version:  $local_version"
echo "Remote link:    $remote_link"

if [[ "$remote_version" == "$local_version" ]]; then
  echo "No update needed."
  exit 0
fi

echo "Updating PKGBUILD and .SRCINFO..."

deb_filename="classin-${remote_version}.deb"
echo "Downloading package: $deb_filename"
wget --show-progress --progress=bar:force:noscroll -O "$deb_filename" "$remote_link"

sha512_value=$(sha512sum "$deb_filename" | awk '{print $1}')

if [[ -z "$sha512_value" ]]; then
  echo "Error: failed to calculate sha512." >&2
  exit 1
fi

sed -i -E "s|^pkgver=.*$|pkgver=$remote_version|" "$pkgbuild_file"
sed -i -E "s|^pkgrel=.*$|pkgrel=1|" "$pkgbuild_file"
#sed -i -E "s|^source_x86_64=.*$|source_x86_64=(\"classin-\${pkgver}.deb::$remote_link\")|" "$pkgbuild_file"
sed -i -E "s|^sha512sums_x86_64=\('.*'\)$|sha512sums_x86_64=('$sha512_value')|" "$pkgbuild_file"

if [[ -f "$srcinfo_file" ]]; then
  sed -i -E "s|^([[:space:]]*pkgver = ).*$|\\1$remote_version|" "$srcinfo_file"
  sed -i -E "s|^([[:space:]]*pkgrel = ).*$|\\11|" "$srcinfo_file"
  sed -i -E "s|^([[:space:]]*source_x86_64 = ).*$|\\1classin-$remote_version.deb::$remote_link|" "$srcinfo_file"
  sed -i -E "s|^([[:space:]]*sha512sums_x86_64 = ).*$|\\1$sha512_value|" "$srcinfo_file"
fi

echo "Updated to version $remote_version."
echo "Updated sha512: $sha512_value"

