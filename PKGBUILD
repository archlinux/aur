# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0

pkgname=reallymakepkg
_pkgver="1.0"
pkgver="v${_pkgver}"
pkgrel=1
pkgdesc="System-independent makepkg"
arch=(any)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${pkgname}"
license=(
  AGPL3)
depends=()
makedepends=()
_url="file://${HOME}/${_pkgname}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  # "git+${url}"
)
sha256sums=(
  ebd3206bbed93382184b468dab8d434d86e96fbb39daf8bedcbe77bed7693d0e
#  SKIP
)

package() {
  cd \
    "${pkgname}-${_pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
