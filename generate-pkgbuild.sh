#!/usr/bin/env bash

set -euo pipefail

BASE_NAME=myks
BASE_DIR="$(mktemp -d --suffix=-${BASE_NAME})"
RELEASE_FILE="${BASE_DIR}/latest-release.json"

CONFLICTS=(
    "${BASE_NAME}"
    "${BASE_NAME}-bin"
    "${BASE_NAME}-git"
)

curl -fsSL https://api.github.com/repos/mykso/myks/releases/latest \
    --header "Authorization: Bearer $GITHUB_TOKEN" \
    -o "${RELEASE_FILE}"

VERSION="$(jq -r '.tag_name' "${RELEASE_FILE}" | sed 's/^v//')"

cat <<EOF
# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=${VERSION:?}
pkgname=${BASE_NAME}-bin
pkgrel=1
pkgdesc='Configuration framework for managing Kubernetes clusters'
provides=(${BASE_NAME})
conflicts=(${CONFLICTS[@]})
arch=(x86_64 aarch64)
url="https://github.com/mykso/${BASE_NAME}"
license=('MIT')

EOF

curl -fsSL \
    "$(jq -r '.assets[] | select(.name == "checksums.txt") | .browser_download_url' "${RELEASE_FILE}")" \
    --header "Authorization: Bearer $GITHUB_TOKEN" \
    -o "${BASE_DIR}/checksums.txt"

cat <<EOF
source_x86_64=("$(jq -r '.assets[] | select(.name | contains("linux_amd64")) | .name + "::" + .browser_download_url' "${RELEASE_FILE}")")
sha256sums_x86_64=("$(grep linux_amd64 "${BASE_DIR}/checksums.txt" | awk '{print $1}')")

source_aarch64=("$(jq -r '.assets[] | select(.name | contains("linux_arm64")) | .name + "::" + .browser_download_url' "${RELEASE_FILE}")")
sha256sums_aarch64=("$(grep linux_arm64 "${BASE_DIR}/checksums.txt" | awk '{print $1}')")

package() {
  install -Dm755 "\${srcdir}/${BASE_NAME}" "\${pkgdir}/usr/bin/${BASE_NAME}"
}
EOF
