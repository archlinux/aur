# Maintainer:  Birk Birkner <aur at bbirkner.de>

pkgname=waydroid-magisk
pkgver=1.2.4
pkgrel=1
pkgdesc="Magisk Delta manager for Waydroid"
arch=('any')
url="https://github.com/nitanmarcel/waydroid-magisk"
license=('GPL3')
depends=('waydroid' 'python' 'dbus-python')
source=("${pkgname}.tar.gz"::"https://github.com/nitanmarcel/waydroid-magisk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6a0143387841d21183c21c26386aa8a4b5cb1dafceea58dede7d7474287e0e74')

package () {
    cd "$srcdir/$pkgname-${pkgver}"
    make install USE_SYSTEMD=1 DESTDIR="${pkgdir}"
}
