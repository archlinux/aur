pkgname=gmt-dcw
pkgver=1.1.4
pkgrel=1
pkgdesc="The Digital Chart of the World Polygon data for the Generic Mapping Tools."
arch=('any')
url="http://gmt.soest.hawaii.edu/"
license=('LGPL')
depends=()
makedepends=()
provides=()
source=(ftp://ftp.soest.hawaii.edu/gmt/dcw-gmt-${pkgver}.tar.gz)
md5sums=('4f30857a8b12af0f910222fceb591538')

build() {
  echo "Nothing to build."
}

package() {
  mkdir -p ${pkgdir}/usr/share/gmt/dcw
  install -m 644 $srcdir/dcw-gmt-${pkgver}/* ${pkgdir}/usr/share/gmt/dcw
}

# vim:set ts=2 sw=2 et:
