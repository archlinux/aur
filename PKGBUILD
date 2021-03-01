# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.7
pkgrel=1
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('any')
license=('GPL3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('40e5cb9a4afd0b93d981e92d93b5996db40d70839a7b6fbfa8ed94ec2793cf69')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/bin
}
