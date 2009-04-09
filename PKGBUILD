# Contributor: Schnouki <thomas.jost@gmail.com>
pkgname=disper
pkgver=0.2.2
pkgrel=1
pkgdesc="An on-the-fly display switch utility, intended to be used on laptops, especially with nVidia cards."
arch=('any')
url="http://willem.engen.nl/projects/disper/"
license=('GPL')
depends=('python')
source=(https://launchpad.net/~wvengen/+archive/ppa/+files/${pkgname}_${pkgver}.tar.gz)
md5sums=('d2d397db52a35fc2f9db78f6747239be')

build() {
  cd "$srcdir/trunk"

  make || return 1
  make DESTDIR="$pkgdir" install
}

