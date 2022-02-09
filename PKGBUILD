# Maintainer: Jelle van der Waa: <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-openntpd
pkgver=1.0
pkgrel=6
pkgdesc="Dispatcher Script for openntpd"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'openntpd' 'sh')
source=("10-openntpd" "LICENSE")
md5sums=('c8762b8a670b894c40a883c2b94a5122'
         'bade437c691452a83923e5064da20757')

package() {
    install -Dm744 $srcdir/10-openntpd $pkgdir/etc/NetworkManager/dispatcher.d/10-openntpd
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
