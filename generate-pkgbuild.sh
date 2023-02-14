#!/usr/bin/env bash

set -euo pipefail

pkgver="$(curl \
  -fsSL \
  https://api.github.com/repos/zebradil/rustotpony/releases/latest \
  --header "Authorization: Bearer $GITHUB_TOKEN" \
  | jq -r '.tag_name')"

cat <<EOF
# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=${pkgver:?}
EOF

cat <<'EOF'

_binname=totp

pkgname=rustotpony-bin
_pkgname=${pkgname%-bin}
pkgrel=1
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
provides=(${_binname})
conflicts=(${_pkgname})
arch=(x86_64)
url="https://github.com/zebradil/${_pkgname}"
license=('MIT')
source=("${url}/releases/download/${pkgver}/${_binname}-linux")
sha256sums=('0000000000000000000000000000000000000000000000000000000000000000')

package() {
  install -Dm755 "${srcdir}/${_binname}-linux" "${pkgdir}/usr/bin/${_binname}"
}
EOF
