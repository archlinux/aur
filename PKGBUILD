# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.4.4
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=(any)
url="https://github.com/linuxmint/blueberry"
license=(GPL)
depends=(bluez-tools gnome-bluetooth python-dbus python-gobject python-setproctitle rfkill xapps)
source=(https://github.com/linuxmint/blueberry/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('5013a622e6361ecf5b5178fc4e7da86941d68aaa5d0dc0e977a5391d90c145cb')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}
