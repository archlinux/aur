#!/usr/bin/env bash
set -euo pipefail

if (( $# > 1 )); then
  printf 'Usage: %s [version]\n' "$0" >&2
  exit 1
fi
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

repo=https://github.com/onurbaydas/VirtoMir
version=${1-}
if [[ $# == 0 ]]; then
  version=$(curl -fsSL --connect-timeout 10 --max-time 60 \
    https://api.github.com/repos/onurbaydas/VirtoMir/releases/latest | jq -er '.tag_name')
fi
version=${version#v}
if [[ ! $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  printf 'Invalid release version: %s\n' "$version" >&2
  exit 1
fi
if [[ $version == "$(sed -n 's/^pkgver=//p' PKGBUILD)" ]]; then
  printf 'Already at version %s; files unchanged.\n' "$version"
  exit 0
fi

fetch_checksum() {
  local asset="virtomir_v${version}_linux_${1}.tar.gz" manifest hash
  manifest=$(curl -fsSL --connect-timeout 10 --max-time 60 \
    "${repo}/releases/download/v${version}/${asset}.sha256") || return
  read -r hash _ <<< "$manifest"
  if [[ ! $hash =~ ^[[:xdigit:]]{64}$ || $manifest != "$hash  $asset" ]]; then
    printf 'Invalid checksum file for %s\n' "$asset" >&2
    return 1
  fi
  printf '%s\n' "$hash"
}

checksum_amd64=$(fetch_checksum amd64)
checksum_arm64=$(fetch_checksum arm64)
workdir=$(mktemp -d .update-version.XXXXXX)
trap 'rm -rf -- "$workdir"' EXIT

sed \
  -e "s/^pkgver=.*/pkgver=${version}/" \
  -e 's/^pkgrel=.*/pkgrel=1/' \
  -e "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${checksum_amd64}')/" \
  -e "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('${checksum_arm64}')/" \
  PKGBUILD > "$workdir/PKGBUILD"
cp -- virtomir.install "$workdir/"
(cd "$workdir" && makepkg --printsrcinfo > .SRCINFO)

mv -- "$workdir/PKGBUILD" PKGBUILD
mv -- "$workdir/.SRCINFO" .SRCINFO
printf 'Updated PKGBUILD and .SRCINFO to %s. Build with: makepkg -si\n' "$version"
