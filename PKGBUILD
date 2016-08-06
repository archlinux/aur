# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=coopgammad
pkgver=1.0
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64)
url="https://github.com/maandree/coopgammad"
license=('GPL3')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e6c4f391d02b2a8f0453c661400890bd8cb1e6414583849b55b91bb4c29ee953)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

