# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=3.3
pkgrel=5
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('c2f503b6bdc12b7249cef42f73a10a6cc448e6e7f52326f26346b3f07c3ea8e3')
options=('!emptydirs')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
}
