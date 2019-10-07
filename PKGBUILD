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
sha256sums=(60e123f824273b5137f98784bb3632c128d9f108448df93420cb5ba2c0450cc6)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
