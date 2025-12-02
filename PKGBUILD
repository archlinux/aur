# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libenv
pkgver=1.0.2
pkgrel=1
pkgdesc="Environment sanitation library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libenv"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(3e086b6a3c73386b632800f0e5420078acbf937a8827d4e16d394f857de8633a)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
