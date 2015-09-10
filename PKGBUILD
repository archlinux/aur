pkgname=gmt-dcw
pkgver=1.1.2
pkgrel=1
pkgdesc="The Digital Chart of the World Polygon data for the Generic Mapping Tools."
arch=('any')
url="http://gmt.soest.hawaii.edu/"
license=('LGPL')
depends=()
makedepends=()
provides=()
source=(ftp://ftp.soest.hawaii.edu/gmt/dcw-gmt-${pkgver}.tar.gz)

build() {
  echo "Nothing to build."
}

package() {
  mkdir -p ${pkgdir}/usr/share/gmt/dcw
  install -m 644 $srcdir/dcw-gmt-${pkgver}/* ${pkgdir}/usr/share/gmt/dcw
}

# vim:set ts=2 sw=2 et:
md5sums=('45c99d30026742dbc0b1644ea64f496d')
