# Maintainer: Jules Maselbas <jmaselbas@zdiv.net>
pkgname=wch-isp
pkgver=0.1
pkgrel=2
pkgdesc="Firmware programmer for WCH microcontrollers over USB"
arch=('i686' 'x86_64')
url="https://github.com/jmaselbas/wch-isp"
license=('GPL2')
groups=()
depends=('libusb>=1.0' 'pkg-config')
makedepends=('make')
optdepends=()
provides=('wch-isp')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://pub.zdiv.net/dist/$pkgname-$pkgver.tar.gz")
noextract=()

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
sha256sums=('993968bf3fc45f72cf92e44f6a2333b8c6ceee3ddda7610a5c6d28abccea1911')
