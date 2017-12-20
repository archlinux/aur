# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.1
pkgrel=4
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('65683b8dabe74483747fd5b8dfbe71abc0ed4c9604dcea5da9f3987d2692815e')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

