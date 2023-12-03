# Maintainer:  Birk Birkner <aur at bbirkner.de>

pkgname=waydroid-magisk
pkgver=1.2.12
pkgrel=1
_commit='1ddd46b087b7e3b0d59ec6dcc3534629e4241458'
pkgdesc="Magisk Delta manager for Waydroid"
arch=('any')
url="https://github.com/nitanmarcel/waydroid-magisk"
license=('GPL3')
depends=(
    'waydroid'
    'python'
    'dbus-python'
)
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/nitanmarcel/waydroid-magisk.git#commit=$_commit")
sha256sums=('SKIP')

package () {
    cd "$srcdir/$pkgname"
    make install USE_SYSTEMD=1 DESTDIR="${pkgdir}"
}
