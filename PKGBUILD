# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.7
pkgrel=2
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('5797ee833a1ca28aa4c78ea7b6ef73f7755d282ce805da94c8cc90fae44b39fd')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/bin
}
