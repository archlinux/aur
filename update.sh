#!/usr/bin/env bash

set -euo pipefail

download_page='https://www.astrill.com/download/linux'

mkdir -p tmp

# Direct links on the download page contain the sha256 of the file
curl -fsSL -A 'Mozilla/5.0' "${download_page}" -o tmp/page.html

sha256_of() {
  grep -oE "/dl/[0-9a-f]{64}/$1" tmp/page.html | head -1 | cut -d/ -f3
}

sha256_i686="$(sha256_of astrill-setup-linux.rpm)"
sha256_x86_64="$(sha256_of astrill-setup-linux64.rpm)"

if [[ -z "${sha256_i686}" || -z "${sha256_x86_64}" ]]; then
  echo "Can't find download links on ${download_page}" >&2
  exit 1
fi

sed "s/^sha256sums_i686=.*/sha256sums_i686=('${sha256_i686}')/" -i PKGBUILD
sed "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${sha256_x86_64}')/" -i PKGBUILD

source PKGBUILD

curl -fL "${source_i686}" -o tmp/astrill-setup-linux.rpm
echo "${sha256_i686}  tmp/astrill-setup-linux.rpm" | sha256sum -c

version_raw="$(dd if=tmp/astrill-setup-linux.rpm ibs=1 skip=18 count=12 status=none)"
version="${version_raw//-/.}"
if [[ "${version}" != "${pkgver}" ]]; then
  sed "s/^pkgver=.*/pkgver=${version}/" -i PKGBUILD
  sed "s/^pkgrel=.*/pkgrel=1/" -i PKGBUILD
fi

makepkg --printsrcinfo > .SRCINFO

rm -r tmp

makepkg -f

echo "
Successfully updated:
  Version ${version}
  ${source_i686} ${sha256_i686}
  ${source_x86_64} ${sha256_x86_64}
"
