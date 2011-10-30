# Maintainer: Jelle van der Waa <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-chrony
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for chrony"
arch=(any)
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'chrony')
source=("10-chrony")
md5sums=('634640886979278dc3a74dbae342d3e7')

package() {
  install -Dm700 $srcdir/10-chrony $pkgdir/etc/NetworkManager/dispatcher.d/10-chrony
}
