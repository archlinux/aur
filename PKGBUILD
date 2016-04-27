# Contributor: gtmanfred
# Contributor: Gene Ruebsamen <ruebsamen.gene@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=socketw
pkgver=1.0.0
pkgrel=1
pkgdesc="a cross platform streaming socket C++ library"
arch=('i686' 'x86_64')
url="http://www.digitalfanatics.org/cal/socketw/"
depends=('openssl')
license=('GPL-2')
source=(https://github.com/RigsOfRods/socketw/archive/v${pkgver}.tar.gz)
md5sums=('54048b3cde37bdd94331748bf9d3c05e')

build() {
  cd $srcdir/socketw-${pkgver}
  make --silent shared
}

package() {
  cd $srcdir/socketw-${pkgver}
  make PREFIX=$pkgdir/usr install
}
