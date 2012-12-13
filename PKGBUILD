# Maintainer: Jelle van der Waa <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-ntpd
pkgver=1.0
pkgrel=5
pkgdesc="Dispatcher Script for ntpd"
arch=(any)
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'ntp')
source=("10-ntpd")
md5sums=('6e2ea87331a44dd83dd992d1ed8363ea')

package() {
  install -Dm700 $srcdir/10-ntpd $pkgdir/etc/NetworkManager/dispatcher.d/10-ntpd
}
