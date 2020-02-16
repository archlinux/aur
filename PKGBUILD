# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.4
pkgrel=2
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('6a9272d1280637218e94973bc001f461daa35581924948039fa28e9635121ae7')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/bin
}
