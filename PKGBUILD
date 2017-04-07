# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

pkgname=openscenegraph-data
_pkgname=OpenSceneGraph-Data
pkgver=3.4.0
pkgrel=1
pkgdesc="Sample Data for OpenSceneGraph"
arch=('any')
license=('custom')
url="http://www.openscenegraph.org"
source=(http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-3.4.0/data/$_pkgname-$pkgver.zip)
sha256sums=('47255cfcbed2b3d7ffb88350738e9d98a3fad60fd025951f284b39563e0d05bb')

package() {
  install -D -m644 ${srcdir}/${_pkgname}/README ${pkgdir}/usr/share/licenses/${pkgname}/README

  install -d ${pkgdir}/usr/share/openscenegraph
  cp -r ${srcdir}/${_pkgname} ${pkgdir}/usr/share/openscenegraph/data
}
