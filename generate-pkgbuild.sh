#!/usr/bin/env bash

set -euo pipefail

pkgver="$(curl -fsSL https://api.github.com/repos/zebradil/rustotpony/releases/latest | jq -r '.tag_name')"

cat <<EOF
# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=${pkgver:?}
EOF

cat <<'EOF'

_binname=totp

pkgname=rustotpony
pkgrel=1
pkgdesc='RusTOTPony — CLI manager of one-time password generators aka Google Authenticator'
provides=('totp')
conflicts=('rustotpony-bin')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/zebradil/${pkgname}"
license=('MIT')
# depends=('libx11' 'libxkbfile')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}::https://github.com/zebradil/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('4a4634ea51ad9b40de09763f532087bfb9b0e142')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
EOF
