# Maintainer: <max at swk-web.com>

_pkgname=php-mago
pkgname=${_pkgname}-bin
_pkgver=1.0.0-beta.12
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Mago is a toolchain for PHP that aims to provide a set of tools to help developers write better code"
arch=('x86_64' 'aarch64')
url='https://github.com/carthage-software/mago'
license=('MIT')
source=("https://github.com/carthage-software/mago/releases/download/${_pkgver}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
  install -D -m 644 "${srcdir}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/mago-${_pkgver}-${CARCH}-unknown-linux-gnu/mago" "${pkgdir}/usr/bin/mago"
}
