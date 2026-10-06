# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=opkssh
pkgname=opkssh-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="opkssh (OpenPubkey SSH)"
arch=('x86_64')
url="https://github.com/openpubkey/opkssh"
license=('Apache-2.0')
conflicts=('opkssh')
provides=('opkssh')

source=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64")

sha256sums=('7da9090ce4abb448683b6770af5efd30d0e6f2c0667cb9b4ddef9a4da3dfc88e')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-x86_64 ${pkgdir}/usr/bin/${_pkgname}
}
