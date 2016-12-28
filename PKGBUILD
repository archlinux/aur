# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=xtest
pkgver=1
pkgrel=1
pkgdesc="Variant of test(1) that can test multiple files from cmdline or stdin"
arch=(i686 x86_64)
url="https://github.com/maandree/xtest"
license=('custom:ISC')
depends=()
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(85c0ad450e73abe44d7295514d602f71de0102854f53f8a1f9baf6feea13624f)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

