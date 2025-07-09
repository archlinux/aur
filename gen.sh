#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <version>" >&2
  exit 1
fi

pkgver="$1"
pkgrel="1"
repo="ahmedmoselhi/distro-grub-themes"
url="https://github.com/${repo}"
release_url="https://github.com/${repo}/releases/download/v${pkgver}"

# Fetch list of `.tar` assets
assets=$(curl -s \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${repo}/releases/tags/v${pkgver}" |
  jq -r '.assets[].name | select(endswith(".tar"))')

# Begin writing PKGBUILD
{
  echo "# Maintainer: envolution"
  echo "# Contributor: ahmedmoselhi <ahmedmoselhi55@gmail.com>"
  echo "# shellcheck shell=bash disable=SC2034,SC2154"
  echo
  echo "pkgbase=distro-grub-themes"
  echo "pkgname=("

  for tarname in $assets; do
    name="${tarname%.tar}"
    echo "  grub-theme-${name}"
  done

  echo ")"
  echo "pkgver=${pkgver}"
  echo "pkgrel=${pkgrel}"
  echo 'pkgdesc="Grub themes for distributions and brands"'
  echo "url=\"${url}\""
  echo "arch=('any')"
  echo "options=(!strip)"
  echo "license=('GPL-3.0-only')"
  echo "source=("

  for tarname in $assets; do
    name="${tarname%.tar}"
    echo "  \"grub-theme-${name}-${pkgver}.tar::${release_url}/${tarname}\""
  done

  echo ")"
  echo 'md5sums=(123)'
  echo 'noextract=("${source[@]%%::*}")'
  echo
  echo "prepare() {"
  echo "  for t in *.tar; do"
  echo "    bn=\"\$(basename \"\$t\" .tar)\""
  echo "    mkdir -p \"\$bn\""
  echo "    tar -xf \"\$t\" -C \"\$bn\""
  echo "  done"
  echo "}"
  echo

  for tarname in $assets; do
    name="${tarname%.tar}"
    pkg="grub-theme-${name}"
    echo "package_${pkg}() {"
    echo "  cd \"\${pkgname}-\${pkgver}\""
    echo "  name=\$(echo \"\${pkgname}\" | sed -e \"s/\\\\b\(.\)/\u\1/g\" | sed -e \"s/^Grub-Theme-//\")"
    echo "  install -d \"\$pkgdir\"/usr/share/grub/themes/\$name"
    echo "  pkgdesc=\"\${name} Theme for Grub2\""
    echo "  cp -a * \"\$pkgdir\"/usr/share/grub/themes/\$name"
    echo "}"
    echo
  done

  echo "# vim:set ts=2 sw=2 et:"
} >PKGBUILD

echo "PKGBUILD generated."
echo "updating shasums..."
updpkgsums
