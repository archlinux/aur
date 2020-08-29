# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=coopgammad
pkgver=1.3.1
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64)
url="https://github.com/maandree/coopgammad"
license=('custom:ISC')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ef66cba3d20df0a021124536927220c7d8e741fb4b75b3951bedaca82e3001c8)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

