# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.4.8
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=(any)
url="https://github.com/linuxmint/blueberry"
license=(GPL)
depends=(bluez-tools gnome-bluetooth python-dbus python-gobject python-setproctitle rfkill xapps)
source=(https://github.com/linuxmint/blueberry/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('37a5b0bc3c7cbccee625209b9196a2e2966396cfe5c7652318559642fb6a7a32')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}
