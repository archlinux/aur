# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=opkssh
pkgname=opkssh-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="opkssh (OpenPubkey SSH)"
arch=('x86_64')
url="https://github.com/openpubkey/opkssh"
license=('Apache-2.0')
conflicts=('opkssh')
provides=('opkssh')

source=("${_pkgname}-linux-x86_64::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64")

sha256sums=('00e3aecbd4c067ed1b9124ea9ad42ee53f2a615765ff0e923be1e795c5dadb12')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-linux-x86_64 ${pkgdir}/usr/bin/${_pkgname}
}
