# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=scheme-langserver
pkgname=${_pkgname}-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="A language server for Scheme"
provides=("${_pkgname}")
arch=('x86_64')
url="https://github.com//ufo5260987423/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux-glibc")
sha256sums=('396c91fd549f097dc990d794b3c2cfbe4d04b6d334e7d7d62d9dcb844450c091')

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/${_pkgname}-x86_64-linux-glibc" "${pkgdir}/usr/bin/${_pkgname}"
}
