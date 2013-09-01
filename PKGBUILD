# Maintainer: Jelle van der Waa <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-ntpd
pkgver=1.0
pkgrel=6
pkgdesc="Dispatcher Script for ntpd"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'ntp')
source=("10-ntpd" "LICENSE")
md5sums=('6e2ea87331a44dd83dd992d1ed8363ea'
         'bade437c691452a83923e5064da20757')

package() {
  install -Dm700 $srcdir/10-ntpd $pkgdir/etc/NetworkManager/dispatcher.d/10-ntpd
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
