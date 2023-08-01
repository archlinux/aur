# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=cpuclock
pkgver=2.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('82838af26f136a9722da7098e9ac4e3bbc50f964019453b7947fb3bc10c40f57')
options=('!emptydirs')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
}
