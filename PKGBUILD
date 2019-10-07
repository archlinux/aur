# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=radharc
pkgver=1.0
pkgrel=1
pkgdesc="Adjusts the color temperature of according to the sun's position"
arch=(i686 x86_64)
url="https://github.com/maandree/radharc"
license=('ISC')
depends=(libcoopgamma libred)
makedepends=(libcoopgamma libclut libred)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(897fa91982279c0119f6d0ef49952ebe34f56b81ee2874de4d0a94338a98b337)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
