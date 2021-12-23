# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.4.6
pkgrel=1
pkgdesc="Bluetooth configuration tool"
arch=(any)
url="https://github.com/linuxmint/blueberry"
license=(GPL)
depends=(bluez-tools gnome-bluetooth python-dbus python-gobject python-setproctitle rfkill xapps)
source=(https://github.com/linuxmint/blueberry/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ee241e0f36b4c108430ff54448e4a750d50dc4815dbb09b8ae4b4ba3848324b5')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r etc usr "$pkgdir"
}
