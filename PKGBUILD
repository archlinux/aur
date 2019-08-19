# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.3
pkgrel=1
pkgdesc="optional map files for Fotoxx"
url="http://kornelix.net/downloads/downloads.html"
arch=('x86_64')
license=('GPL3')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('40a86bbbc1a249a85dad673b76107b6b1e9f32f7280edc20afeaa59c3743b649')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
