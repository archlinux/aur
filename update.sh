#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [[ $# -gt 1 ]]; then
    echo "Usage: $0 [version]" >&2
    exit 2
fi

if [[ $# -eq 1 ]]; then
    version=${1#v}
else
    version=$(curl -fsSL https://api.github.com/repos/cloud-ru-tech/cloudlogin/releases/latest \
        | sed -n 's/.*"tag_name": "v\([^"]*\)".*/\1/p' | head -n 1)
fi

if [[ ! $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Could not determine a valid release version: $version" >&2
    exit 1
fi

archive=$(mktemp)
trap 'rm -f "$archive"' EXIT
curl -fL --retry 3 -o "$archive" \
    "https://github.com/cloud-ru-tech/cloudlogin/releases/download/v${version}/cloudlogin_Linux_amd64.tar.gz"
tar -tzf "$archive" | grep -Eq '^\./?cloudlogin$|^cloudlogin$'
checksum=$(sha256sum "$archive" | cut -d' ' -f1)

sed -i \
    -e "s/^pkgver=.*/pkgver=${version}/" \
    -e 's/^pkgrel=.*/pkgrel=1/' \
    -e "s/^sha256sums=.*/sha256sums=('${checksum}')/" \
    PKGBUILD
makepkg --printsrcinfo > .SRCINFO
echo "Updated to ${version}; SHA-256: ${checksum}"
