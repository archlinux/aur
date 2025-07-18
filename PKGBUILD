# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=opkssh
pkgname=opkssh-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="opkssh (OpenPubkey SSH)"
arch=('x86_64')
url="https://github.com/openpubkey/opkssh"
license=('Apache-2.0')
conflicts=('opkssh')
provides=('opkssh')

source=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64")

sha256sums=('72911e917be2d1ba610d5a03790d421b95518596627ffdf8be024958346f8d9c')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-x86_64 ${pkgdir}/usr/bin/${_pkgname}
}
