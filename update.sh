#!/bin/bash

set -x

set -eo pipefail

rm -rf pkg src pluralith-cli-bin pluralith-cli-bin-0.1.1-1-x86_64.pkg.tar.zst || true

[[ -n "$GITHUB_TOKEN" ]] && GITHUB_AUTH="Authorization: ${GITHUB_TOKEN}" || GITHUB_AUTH=""

LATEST_RELEASE_INFO=$(http https://api.github.com/repos/Pluralith/pluralith-cli/releases/latest \
  "Accept: application/vnd.github.v3+json" ${GITHUB_AUTH})

pkgver=$(jq -r .name <<< "${LATEST_RELEASE_INFO}")

sed -i -r 's/(pkgver=).*/\1'"${pkgver#v}"'/g' PKGBUILD

updpkgsums

makepkg --printsrcinfo --clean >.SRCINFO
