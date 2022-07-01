# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.7
pkgrel=4
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('963dc05eef03f19826e6f7aa70cc67cf1de6b6d3e60c2fe5d19bed68e1aedc93')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/bin
}
