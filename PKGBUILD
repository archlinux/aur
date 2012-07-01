# Maintainer: Jelle van der Waa <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-ntpd
pkgver=1.0
pkgrel=3
pkgdesc="Dispatcher Script for ntpd"
arch=(any)
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'ntp')
source=("10-ntpd")
md5sums=('97956638b7e41fd4756b79bf9cd44000')

package() {
  install -Dm700 $srcdir/10-ntpd $pkgdir/etc/NetworkManager/dispatcher.d/10-ntpd
}
