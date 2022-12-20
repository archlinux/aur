# Maintainer: Lu Xu <oliver_lew at outlook dot com>
pkgname=0xffff
pkgver=0.10
pkgrel=2
pkgdesc="Open Free Fiasco Firmware Flasher for Maemo devices"
arch=("x86_64" "i686")
url="https://github.com/pali/0xFFFF"
license=('GPL3')
depends=("libusb0")
makedepends=()
optdepends=()
source=("$url/releases/download/$pkgver/0xFFFF-$pkgver.tar.gz")
sha256sums=("3bef85dcb4fa51644fbea8d60a5184a03f04ea634560d6f998e667ada392775c")

build() {
	cd "0xFFFF-$pkgver"
	make
}

package() {
	cd "0xFFFF-$pkgver"
	make PREFIX=/usr DESTDIR=$pkgdir install
}
