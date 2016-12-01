# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cg-tools
pkgver=1.0.1
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://github.com/maandree/cg-tools"
license=('GPL3')
depends=(libcoopgamma)
makedepends=(libcoopgamma)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(b27dbf74cc537932df8fab4a26f2dedccf4f7b4aa43ad3dcf7596ba430b11f88)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

