# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: nisk1

pkgname=asap
pkgver=5.1.0
pkgrel=1
pkgdesc="Another Slight Atari Player - library and players for 8-bit Atari music format"
url="http://asap.sourceforge.net"
arch=('x86_64')
license=('GPL2')
source=("https://downloads.sourceforge.net/asap/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ec881c6894d00e669e25a9c22f7ceae38ea65bd6240ec00d0a4f475c13b642b0')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix="/usr" install
}
