# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=scheme-langserver
pkgname=${_pkgname}-bin
pkgver=2.1.5
pkgrel=1
pkgdesc="A language server for Scheme"
provides=("${_pkgname}")
arch=('x86_64')
url="https://github.com//ufo5260987423/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux-glibc")
sha256sums=('5b3e160ab691bde1d7215631129af455f9788f859137bbd7fcc6d255dd9d2477')

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/${_pkgname}-x86_64-linux-glibc" "${pkgdir}/usr/bin/${_pkgname}"
}
