# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=scheme-langserver
pkgname=${_pkgname}-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="A language server for Scheme"
provides=("${_pkgname}")
arch=('x86_64')
url="https://github.com//ufo5260987423/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux-glibc")
sha256sums=('8cc5c6c5027dbaa14e51ad7e801e5390bc561c8a04e5653b9d63f35cf6f72c49')

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/${_pkgname}-x86_64-linux-glibc" "${pkgdir}/usr/bin/${_pkgname}"
}
