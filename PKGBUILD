# Maintainer: Mehdi Abaakouk <sileht@sileht.net>
pkgbase=mapbox-variant
pkgname=mapbox-variant
pkgver=1.2.0
pkgrel=3
pkgdesc="An header-only alternative to boost::variant for C++11 and C++14"
arch=('x86_64')
url="https://github.com/mapbox/variant"
license=('BSD')
depends=('git')
makedepends=('cmake')
source=("https://github.com/mapbox/variant/archive/v${pkgver}.tar.gz")
sha256sums=('7059f4420d504c4bc96f8a462a0f6d029c5be914ba55cc030a0a773366dd7bc8')

package() {
  mkdir -p ${pkgdir}/usr/include/mapbox/
  cp -a ${srcdir}/variant-${pkgver}/include/mapbox/*.hpp ${pkgdir}/usr/include/mapbox/
}
