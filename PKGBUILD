# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=dlu
pkgver=1
pkgrel=1
pkgdesc="Program for quickly looking up words in scanned dictionaries"
arch=(any)
url="https://github.com/maandree/dlu"
license=('custom:ISC')
depends=(python3)
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(ae986e982fe8a6dcddf34e64b3c375ae6bb4738513e47f9c7b6b92c1191cd73f)


package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

