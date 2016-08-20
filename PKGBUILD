# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libcoopgamma
pkgver=1.1
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcoopgamma"
license=('GPL3')
depends=(coopgammad)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(8f55b895a9605887e3c5b65b68d5b069aadb026e84344824cb82258782c1f304)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

