# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.2
pkgrel=3
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('9d1874c344668d0252c8388ca516fbda0f1e7cb399d495ea110296cabd545d89')

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
