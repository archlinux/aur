# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.2
pkgrel=1
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('8d5e8c237036f0681ad96fa7532d5302d7622b8ddf2fdbb25b80b3dcb203b644')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

