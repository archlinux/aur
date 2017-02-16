# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=coopgammad
pkgver=1.2.2
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64)
url="https://github.com/maandree/coopgammad"
license=('GPL3')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(33944c4fd3dc6ce447307069480f2b388a4e3c27d59ba6feb1c8b47327388604)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

