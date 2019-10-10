# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=radharc
pkgver=1.0.1
pkgrel=1
pkgdesc="Adjusts the color temperature of according to the sun's position"
arch=(i686 x86_64)
url="https://github.com/maandree/radharc"
license=('ISC')
depends=(libcoopgamma libred)
makedepends=(libcoopgamma libclut libred)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(248190dbad93f2da390f8e5633f0f6ca9672c8f50807388bd51efc36fb1cd3b7)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
