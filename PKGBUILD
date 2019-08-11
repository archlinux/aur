# Maintainer: Alexandros Theodotou <alex@zrythm.org>

pkgname=jack-stdio
pkgver=1.5
pkgrel=1
pkgdesc="unix pipe audio-data from and to JACK"
arch=('any')
url="https://github.com/x42/jack-stdio"
license=('GPL2')
depends=('jack')
source=("https://github.com/x42/jack-stdio/archive/v${pkgver}.tar.gz")
md5sums=('ca2c861f7060a28d67375b94f565616c')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install PREFIX=/usr
}
