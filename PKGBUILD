# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libcoopgamma
pkgver=1.2
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcoopgamma"
license=('GPL3')
depends=(coopgammad)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(33b9a2126c62d38ff15109c5f4cd255240231add6e4ac15991de2e5aedd2fd55)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

