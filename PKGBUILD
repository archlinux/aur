# Author: Samuel Fernando Mesa <samuelmesa at linuxmail dot org>

pkgname=qgis-crayfish-plugin
pkgver='3.0.0'
pkgrel=1
pkgdesc="Visualiser for temporal structured and unstructured grids in QGIS  3.3.x "
arch=('i686' 'x86_64')
url="https://www.lutraconsulting.co.uk/products/crayfish/"
license=('GPL3')
depends=('qgis-git' 'gdal' 'hdf5' 'netcdf' 'python2' 'python2-sip')
source=(https://github.com/lutraconsulting/qgis-crayfish-plugin/archive/release-${pkgver}.tar.gz)
md5sums=('3195816365e31a46b6575c2bc56d5089')

package() {
  cd "${pkgname}-release-${pkgver}"
  mkdir -p ${pkgdir}/opt/qgis-git/share/qgis/python/plugins/
  cp -dr --no-preserve=ownership crayfish "${pkgdir}/opt/qgis-git/share/qgis/python/plugins/"
}
