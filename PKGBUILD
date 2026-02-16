# Maintainer: zarazaex <zarazaex@tuta.io>
pkgname=rz-pm-bin
_pkgname=rz-pm
pkgver=0.3.3
pkgrel=1
pkgdesc="Rizin package manager (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/rizinorg/rz-pm"
license=('LGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/rizinorg/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64")
sha256sums=('92ee648c5948a9363c9f0d297bbbdd42aeb648316953d491d19faffd35cf1308')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-linux-x86_64" "${pkgdir}/usr/bin/${_pkgname}"
}
