# Maintainer: Jelle van der Waa <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-ntpd
pkgver=1.0
pkgrel=4
pkgdesc="Dispatcher Script for ntpd"
arch=(any)
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'ntp')
source=("10-ntpd")
md5sums=('340dd6683fcb30aa0b4c64a26d3bc48a')

package() {
  install -Dm700 $srcdir/10-ntpd $pkgdir/etc/NetworkManager/dispatcher.d/10-ntpd
}
