# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=cg-tools
pkgver=1.4.3
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://codeberg.org/maandree/cg-tools"
license=('custom:ISC')
depends=(libcoopgamma)
makedepends=(libcoopgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(623989407b053cba86e221786dff456c11027b47780d792c847447b23c97af65)


build() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir"
}

