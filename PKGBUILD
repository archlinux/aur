# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.3.9
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=(any)
url="https://github.com/linuxmint/blueberry"
license=(GPL)
depends=(bluez-tools gnome-bluetooth python-dbus python-gobject python-setproctitle rfkill xapps)
source=(https://github.com/linuxmint/blueberry/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a06dd2876f66cc4fc49e8bbd9ea0c52e17071a8cc2e47846f19e4f8729046108')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}
