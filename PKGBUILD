# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.1
pkgrel=3
pkgdesc="optional map files for Fotoxx"
url="http://www.kornelix.com/fotoxx"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('9f5898fdb892f3664e41a424707a8fabeef68d740f615bb475493561ea39e576')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

