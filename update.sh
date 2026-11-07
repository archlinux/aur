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
    release_json=$(curl -fsSL https://api.github.com/repos/shatim-ops/evo-cli/releases/latest)
    version=$(sed -n 's/.*"tag_name": "v\([^"]*\)".*/\1/p' <<< "$release_json")
fi

if [[ ! $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Could not determine a valid release version: $version" >&2
    exit 1
fi

current_version=$(sed -n 's/^pkgver=//p' PKGBUILD)
if [[ $version == "$current_version" ]]; then
    echo "Already up to date: ${version}"
    exit 0
fi

checksums=$(curl -fsSL "https://github.com/shatim-ops/evo-cli/releases/download/v${version}/checksums.txt")

checksum_for() {
    local filename=$1
    awk -v filename="$filename" '$2 == filename { print $1 }' <<< "$checksums"
}

sha256_amd64=$(checksum_for "evo_${version}_linux_amd64.tar.gz")
sha256_arm64=$(checksum_for "evo_${version}_linux_arm64.tar.gz")

if [[ ! $sha256_amd64 =~ ^[[:xdigit:]]{64}$ || ! $sha256_arm64 =~ ^[[:xdigit:]]{64}$ ]]; then
    echo "Release checksums are missing or invalid for version $version" >&2
    exit 1
fi

sed -i \
    -e "s/^pkgver=.*/pkgver=${version}/" \
    -e 's/^pkgrel=.*/pkgrel=1/' \
    -e "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${sha256_amd64}')/" \
    -e "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('${sha256_arm64}')/" \
    PKGBUILD
makepkg --printsrcinfo > .SRCINFO
echo "Updated to ${version}"
