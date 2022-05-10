# Maintainer: Jelle van der Waa <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-ntpd
pkgver=1.0
pkgrel=7
pkgdesc="Dispatcher Script for ntpd"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'ntp' 'bash' 'systemd')
source=("10-ntpd" "LICENSE")
md5sums=('d5560568ec1ca8694595328809fbeefe'
         'bade437c691452a83923e5064da20757')

package() {
  install -Dm700 $srcdir/10-ntpd $pkgdir/etc/NetworkManager/dispatcher.d/10-ntpd
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
