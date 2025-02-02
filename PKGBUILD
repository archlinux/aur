# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=cg-tools
pkgver=1.4.2.1
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://codeberg.org/maandree/cg-tools"
license=('ISC')
depends=(libcoopgamma)
makedepends=(libcoopgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(b2de586443079262ddddae01b19437a8241758d0076553f8417b48c1aeaf65d3)


build() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir"
}

