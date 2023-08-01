# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=cpuclock
pkgver=2.0
pkgrel=2
arch=('x86_64')
license=('GPL3')
depends=('clutter-gtk' 'gcc-libs')
pkgdesc="adjust CPU clock and monitor CPU power"
url="http://www.kornelix.net/$pkgname/$pkgname.html"
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
