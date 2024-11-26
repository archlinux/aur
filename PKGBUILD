# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=cg-tools
pkgver=1.4.2
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://codeberg.org/maandree/cg-tools"
license=('ISC')
depends=(libcoopgamma)
makedepends=(libcoopgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(93227df79f7e59df29701960b6d12c840e799e6ab735e345c238d35d69199f49)


build() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir"
}

