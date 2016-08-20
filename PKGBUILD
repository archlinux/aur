# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=coopgammad
pkgver=1.1
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64)
url="https://github.com/maandree/coopgammad"
license=('GPL3')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(c3a1902c471b3224b60806fc8644c27d1879c87e94738ddad77d7b4a262fb713)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

