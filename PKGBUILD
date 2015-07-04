# Contributor: Benjamin Sick
pkgname=gmt-coast
pkgver=2.3.4
pkgrel=1
pkgdesc="The full resolution coastline dataset for the Generic Mapping Tools."
arch=('any')
url="http://gmt.soest.hawaii.edu/"
license=('LGPL')
depends=()
makedepends=()
provides=()
source=(ftp://ftp.soest.hawaii.edu/gshhg/gshhg-gmt-${pkgver}.tar.gz)
md5sums=('80947a92cc88927aff070556ca5ab133')

build() {
  echo "Nothing to build."
}

package() {
  mkdir -p ${pkgdir}/usr/share/gmt/coast
  install -m 644 $startdir/src/gshhg-gmt-${pkgver}/binned* \
    ${pkgdir}/usr/share/gmt/coast
}

# vim:set ts=2 sw=2 et:
