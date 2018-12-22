# Maintainer: Alexandros Theodotou <alex at alextee dot online>

pkgname=jack-stdio
pkgver=1.4
pkgrel=2
pkgdesc="unix pipe audio-data from and to JACK"
arch=('x86_64')
url="https://github.com/x42/jack-stdio"
license=('GPL2')
depends=('jack')
source=("https://github.com/x42/jack-stdio/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install PREFIX=/usr
}
