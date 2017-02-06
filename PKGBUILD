# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=coopgammad
pkgver=1.2.1
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64)
url="https://github.com/maandree/coopgammad"
license=('GPL3')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(497967682c03e6eae71a34327d20a1cdc4fb03524c63895b7c619a0ab926e55c)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

