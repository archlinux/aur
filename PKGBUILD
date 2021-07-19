# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc-bin
pkgver=1.7.2
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
sha256sums=('b625524d2c46780f9200d37be38464f20d51815dfe6d33dbdeeebd4112ab0756')

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-${pkgver}" "${pkgdir}/usr/bin/pax"
}
