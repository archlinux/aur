# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=opkssh
pkgname=opkssh-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="opkssh (OpenPubkey SSH)"
arch=('x86_64')
url="https://github.com/openpubkey/opkssh"
license=('Apache-2.0')
conflicts=('opkssh')
provides=('opkssh')

source=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64")

sha256sums=('c018c3e7baf98612b923e742dd87be38650bf61e3b755fb2bc90de177568b1bf')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-x86_64 ${pkgdir}/usr/bin/${_pkgname}
}
