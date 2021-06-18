# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="The MC modpack manager for professionals. Binary version"
arch=('x86_64')
url="https://github.com/froehlicha/pax"
license=('MIT')
depends=()
provides=('pax-mc')
conflicts=('pax-mc' 'pax-mc-git')
replaces=()
changelog=
source=("pax-${pkgver}::https://github.com/froehlichA/pax/releases/download/v.${pkgver}/pax")
sha256sums=('0958dcdb5d1f2d45a262267156fde587baf0bf93a63ec31756448b1428aa0194')

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}" "${pkgdir}/usr/bin/pax"
}
