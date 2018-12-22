# Maintainer: Alexandros Theodotou <alex at alextee dot online>

pkgname=jack-stdio
pkgver=1.4
pkgrel=1
pkgdesc="unix pipe audio-data from and to JACK"
arch=('x86_64')
url="https://github.com/x42/jack-stdio/tree/v1.4"
license=('GPL')
depends=('jack')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/x42/jack-stdio.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install PREFIX=/usr
}


