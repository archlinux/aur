# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=scheme-langserver
pkgname=${_pkgname}-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="A language server for Scheme"
provides=("${_pkgname}")
arch=('x86_64')
url="https://github.com//ufo5260987423/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux-glibc")
sha256sums=('052f4218a810a6a6bf2f51267b876de2926b29efd6ad6ef36534b8dd7d1bca5d')

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/${_pkgname}-x86_64-linux-glibc" "${pkgdir}/usr/bin/${_pkgname}"
}
