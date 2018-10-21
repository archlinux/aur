# Author: Samuel Fernando Mesa <samuelmesa at linuxmail dot org>

pkgname=qgis-otb-plugin
_pkgname=qgis-otb-plugin-master
pkgver='6.6.0'
pkgrel=1
pkgdesc="OTB provider for QGIS Processing in QGIS  3.x.x"
arch=('i686' 'x86_64')
url="https://gitlab.orfeo-toolbox.org/orfeotoolbox/qgis-otb-plugin"
license=('GPL3')
depends=('qgis' 'python' 'orfeo-toolbox')
source=(https://gitlab.orfeo-toolbox.org/orfeotoolbox/qgis-otb-plugin/-/archive/master/qgis-otb-plugin-master.tar.gz)
md5sums=(SKIP)

package() {
  cd "${_pkgname}"
  mkdir -p ${pkgdir}/usr/share/qgis/python/plugins/
  cp -dr --no-preserve=ownership otb "${pkgdir}/usr/share/qgis/python/plugins/"
}
