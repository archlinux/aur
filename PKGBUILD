# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=opkssh
pkgname=opkssh-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="opkssh (OpenPubkey SSH)"
arch=('x86_64')
url="https://github.com/openpubkey/opkssh"
license=('Apache-2.0')
conflicts=('opkssh')
provides=('opkssh')

source=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64")

sha256sums=('7e23392ad7f908a69e4c4f543522794b83385dfdd8ef31b6888a5edb7afb3700')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-x86_64 ${pkgdir}/usr/bin/${_pkgname}
}
