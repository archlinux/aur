# Maintainer: Jelle van der Waa: <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-openntpd
pkgver=1.0
pkgrel=6
pkgdesc="Dispatcher Script for openntpd"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'openntpd')
source=("10-openntpd" "LICENSE")
md5sums=('dd166c51a2bff847e4157455e15b2083'
         'bade437c691452a83923e5064da20757')

package() {
    install -Dm700 $srcdir/10-openntpd $pkgdir/etc/NetworkManager/dispatcher.d/10-openntpd
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
