# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=disper
pkgver=0.2.3
pkgrel=1
pkgdesc="An on-the-fly display switch utility, intended to be used on laptops, especially with nVidia cards."
arch=('any')
url="http://willem.engen.nl/projects/disper/"
license=('GPL')
depends=('python')
source=(https://launchpad.net/~wvengen/+archive/ppa/+files/${pkgname}_${pkgver}.tar.gz)
md5sums=('85b4cde564fc27b7249826e0a4379394')

build() {
  cd "$srcdir/trunk"

  make || return 1
  make DESTDIR="$pkgdir" install
}

