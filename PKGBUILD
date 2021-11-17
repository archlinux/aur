# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc-bin
pkgver=1.9.5
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
source=("pax-${pkgver}::https://github.com/froehlichA/pax/releases/download/v${pkgver}/pax")
sha256sums=('24510c4c3cebf3a5bf68459c678de0d7e53cb82f7f62973c73b94f19c411df45')

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}" "${pkgdir}/usr/bin/pax"
}
