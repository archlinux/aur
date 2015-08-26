# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

pkgname="dunst-service"
pkgver=1.0
pkgrel=1
pkgdesc="A systemd service file for Dunst, the notification daemon."
arch=('any')
url="https://github.com/knopwob/dunst"
license=('GPL2')
depends=('dunst')
source=('dunst.service')
sha256sums=('10077cf4cf374fa17ca53a8bf6bc0bb672da6c3ad91f1b3c2d03e07c65506b07')

package() {
    install -Dm644 $srcdir/dunst.service $pkgdir/usr/lib/systemd/system/dunst.service
}
