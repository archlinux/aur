# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="The MC modpack manager for professionals. Binary version"
arch=('x86_64')
url="https://github.com/froehlicha/pax"
license=('MIT')
depends=()
provides=('pax-mc')
conflicts=()
replaces=()
changelog=
source=("pax-${pkgver}::https://github.com/froehlichA/pax/releases/download/v${pkgver}/pax")
sha256sums=('13a9a6f67f1934c106184bc9e154e19f8711e679863faad0ae45939c3fe7e7a4')

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}" "${pkgdir}/usr/bin/pax"
}
