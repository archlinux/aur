# Maintainer: SanskritFritz (gmail)

pkgname=wmtext
pkgver=3
pkgrel=1
pkgdesc="Dockapp that displays the output of a shell command."
url="http://fccode.free.fr/dockapps.html"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('libdockapp' 'libxpm')
source=("http://fccode.free.fr/$pkgname-$pkgver.tbz2")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir --parents "$pkgdir/usr/bin"
	make BIN_DIR="$pkgdir/usr/bin" install
}

md5sums=('e671150c63bfe68c09a945d3b56a9414')
