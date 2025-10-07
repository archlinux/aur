#!/usr/bin/env bash
set -euo pipefail

# Automates bumping the package version and refreshing metadata.
if [[ $# -ne 1 ]]; then
    printf 'Usage: %s <new-version>\n' "$0" >&2
    exit 1
fi

new_ver=$1
pkgbuild="PKGBUILD"

if [[ ! -f $pkgbuild ]]; then
    echo "PKGBUILD not found in $(pwd)" >&2
    exit 1
fi

pkgname=$(awk -F= '/^pkgname=/{print $2; exit}' "$pkgbuild")
current_ver=$(awk -F= '/^pkgver=/{print $2; exit}' "$pkgbuild")

if [[ -z $pkgname ]]; then
    echo 'Failed to parse pkgname from PKGBUILD' >&2
    exit 1
fi

if [[ -z $current_ver ]]; then
    echo 'Failed to parse current pkgver from PKGBUILD' >&2
    exit 1
fi

if [[ $current_ver != "$new_ver" ]]; then
    sed -i "s/^pkgver=.*/pkgver=$new_ver/" "$pkgbuild"
    echo "pkgver: $current_ver -> $new_ver"
else
    echo "pkgver already $new_ver; refreshing checksums"
fi

mapfile -t checksum_lines < <(makepkg -g)
sha_line=''
for line in "${checksum_lines[@]}"; do
    if [[ $line == sha256sums* ]]; then
        sha_line=$line
        break
    fi
done

if [[ -z $sha_line ]]; then
    echo 'makepkg -g did not return sha256sums line' >&2
    exit 1
fi

sed -i "s~^sha256sums=.*~$sha_line~" "$pkgbuild"
echo "Updated sha256sums"

rm -rf src pkg
rm -f "${pkgname}-"*.tar.gz

makepkg --printsrcinfo > .SRCINFO
echo "Regenerated .SRCINFO"
