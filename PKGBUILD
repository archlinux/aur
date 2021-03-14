# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.4.2
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=(any)
url="https://github.com/linuxmint/blueberry"
license=(GPL)
depends=(bluez-tools gnome-bluetooth python-dbus python-gobject python-setproctitle rfkill xapps)
source=(https://github.com/linuxmint/blueberry/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('d585e737d2c974f8027889852f2fb15d0c727a58ea12e8de4007bdaed3517d56')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}
