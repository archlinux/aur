#!/bin/bash

set -x

set -eo pipefail

rm SHA256SUMS cloud-nuke_linux_amd64 cloud-nuke_linux_386 cloud-nuke-bin-*x86_64.pkg.tar.zst cloud-nuke-bin || true

rm -rf pkg src || true

[[ -n "$GITHUB_TOKEN" ]] && GITHUB_AUTH="Authorization: ${GITHUB_TOKEN}" || GITHUB_AUTH=""

LATEST_RELEASE_INFO=$(http https://api.github.com/repos/gruntwork-io/cloud-nuke/releases/latest \
  "Accept: application/vnd.github.v3+json" ${GITHUB_AUTH})

jq -r '.assets[] | select(.name | test("^(SHA256SUMS|cloud-nuke.*_linux_(amd64|386))$")) | .browser_download_url' <<< "$LATEST_RELEASE_INFO" |
  xargs -n 1 -P 3 wget

sha256sum --ignore-missing --status -c SHA256SUMS

pkgver=$(jq -r .name <<< "${LATEST_RELEASE_INFO}")

X86_64_SHA=$(awk '/cloud-nuke.*_linux_amd64$/ {print $1}' SHA256SUMS)

I386_SHA=$(awk '/cloud-nuke.*_linux_386$/ {print $1}' SHA256SUMS)

sed -i -r 's/(pkgver=).*/\1'"${pkgver#v}"'/g' PKGBUILD

sed -i -r 's/(sha256sums_x86_64=)\([A-Fa-f0-9]*\)/\1\('"$X86_64_SHA"'\)/g' PKGBUILD

sed -i -r 's/(sha256sums_i386=)\([A-Fa-f0-9]*\)/\1\('"$I386_SHA"'\)/g' PKGBUILD

makepkg --printsrcinfo >.SRCINFO
