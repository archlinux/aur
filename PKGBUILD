# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cg-tools
pkgver=1.2.1
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://github.com/maandree/cg-tools"
license=('GPL3')
depends=(libcoopgamma)
makedepends=(libcoopgamma)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(c5bead670c9276ed52ab319c85be8705ca89d37a64d2ffa09b178a6eb40d7756)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

