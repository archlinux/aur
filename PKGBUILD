# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.7
pkgrel=3
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('d1ea67911b98e486ca1fada7754baefbb814d23e823fed97612c9772cda88ccb')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/bin
}
