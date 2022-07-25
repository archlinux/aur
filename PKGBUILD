# Maintainer: Jules Maselbas <jmaselbas@zdiv.net>
pkgname=wch-isp
pkgver=0.1.1
pkgrel=1
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
sha256sums=('e1693a396405caab673bfd4709e9a036b7acc2871e19e129d24bf079891553b6')
