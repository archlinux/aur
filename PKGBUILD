# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cg-tools
pkgver=1.4.1
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://github.com/maandree/cg-tools"
license=('ISC')
depends=(libcoopgamma)
makedepends=(libcoopgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8a66bb5109e4c81a72f9aa9d48658fdd8afe0ca094ca5a7978986492ebc73d99)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

