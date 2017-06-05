# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=1.0
sha256sums=('2904bb0071e5d07e3e2747ddfddfa28dcff3189863a2d7c730c94b55fe84efb5')

pkgname=spaghetti
pkgdesc='Joke text utility - replaces ASCII letters with unicode letters that look the same'
arch=('any')
url='https://github.com/EinBaum/spaghetti'
license=('GPL')
source=("https://github.com/EinBaum/spaghetti/archive/$pkgver.tar.gz")

build() {
	cd $srcdir/spaghetti-$pkgver
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/spaghetti-$pkgver/spaghetti" "$pkgdir/usr/bin/spaghetti"
}
