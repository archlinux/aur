# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

pkgname=openscenegraph-data
_pkgname=OpenSceneGraph-Data
pkgver=3.0.0
pkgrel=1
pkgdesc="Sample Data for OpenSceneGraph"
arch=('any')
license=('custom')
url="http://www.openscenegraph.org"
source=(http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-3.0/data/$_pkgname-$pkgver.zip)
md5sums=('63fb11ecfbe750d9ed35217b2f77d067')

package() {
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/README ${pkgdir}/usr/share/licenses/${pkgname}/README

  install -d ${pkgdir}/usr/share/openscenegraph
  cp -r ${srcdir}/${_pkgname}-${pkgver} ${pkgdir}/usr/share/openscenegraph/data
}
