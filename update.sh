#!/bin/bash

set -x

set -eo pipefail

pkgname=qrcp-bin

rm ${pkgname/-bin/}*  checksums.txt || true

rm -rf pkg src || true

[[ -n "$GITHUB_TOKEN" ]] && GITHUB_AUTH="Authorization: ${GITHUB_TOKEN}" || GITHUB_AUTH=""

http https://api.github.com/repos/claudiodangelis/qrcp/releases/latest \
  "Accept: application/vnd.github.v3+json" ${GITHUB_AUTH} |
  jq -r '.assets[] | select(.name | test("^(checksums.txt|qrcp.*_linux_(x86_64|i386).tar.gz)$")) | .browser_download_url' |
  xargs -n 1 -P 3 wget

sha256sum --ignore-missing --status -c checksums.txt

pkgver=$(http https://api.github.com/repos/claudiodangelis/qrcp/releases/latest \
  "Accept: application/vnd.github.v3+json" ${GITHUB_AUTH} |
  jq -r '.name')

I386_SHA=$(awk '/qrcp.*_linux_i386.tar.gz$/ {print $1}' checksums.txt)

X86_64_SHA=$(awk '/qrcp.*_linux_x86_64.tar.gz$/ {print $1}' checksums.txt)

sed -i -r 's/(pkgver=).*/\1'"${pkgver#v}"'/g' PKGBUILD

sed -i -r 's/(sha256sums_x86_64=)\([A-Fa-f0-9]*\)/\1\('"$X86_64_SHA"'\)/g' PKGBUILD

sed -i -r 's/(sha256sums_i386=)\([A-Fa-f0-9]*\)/\1\('"$I386_SHA"'\)/g' PKGBUILD

makepkg --printsrcinfo >.SRCINFO
