# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_py="python"
_py2="${_py}2"
pkgname=luks-tools
pkgver=0.0.0.0.0.1
pkgrel=1
pkgdesc="A collection of LUKS related scripts."
arch=(
  any
)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${pkgname}"
license=(
  AGPL3
)
depends=(
  bash
)
makedepends=(
  git
)
optdepends=(
)
provides=(
  "${pkgname}=${pkgver}")
conflicts=(
  "${pkgname}")
_url="file://${HOME}/${pkgname}"
_branch="master"
_commit="84fb4c00f9569e4e182dca872563c35c7257d8c6"
source=(
  "git+${url}#commit=${_commit}"
)
sha256sums=(
  SKIP
)

package() {
  cd \
    "${pkgname}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
