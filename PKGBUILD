# Maintainer: h_asdf <aur@hasdf.de>
pkgname=min12xxw
pkgver=0.0.9
pkgrel=2
pkgdesc="Minolta PagePro 1[234]xxW printers driver"
arch=('i686' 'x86_64')
license=('GPL')
depends=('foomatic-db')
url='http://www.hinterbergen.de/mala/min12xxw/'
source=('http://www.hinterbergen.de/mala/min12xxw/min12xxw-0.0.9.tar.gz')
md5sums=('3582da7bd8d2d612b1fbcbfdb8b3239a')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
