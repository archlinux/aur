# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cg-tools
pkgver=1.0
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://github.com/maandree/cg-tools"
license=('GPL3')
depends=(libcoopgamma)
makedepends=(libcoopgamma)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(ff7daf5380becb843c0aa30085e8f246ad4328d86013249d3e38e455f664bd7a)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

