# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cg-tools
pkgver=1.3
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://github.com/maandree/cg-tools"
license=('GPL3')
depends=(libcoopgamma)
makedepends=(libcoopgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f13af03db5e9e3d9345c10007d74fd3e3f8666a68f031c4407ce68d6fca25392)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

