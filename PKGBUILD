# Maintainer: Uffe Jakobsen <my first name [at] my first name [dot] org>
 
pkgname=cura-resources-materials
pkgver=2.6.0
pkgrel=1
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=("cura")
provides=("cura-resource-materials")
url="https://ultimaker.com/en/products/cura-software"
license=("AGPL")
arch=("any")
source=(fdm_materials-$pkgver.tar.gz::https://github.com/Ultimaker/fdm_materials/archive/${pkgver}.tar.gz)
sha1sums=('a199f709a60c91ee7a6fceefa903b8241ebaef07')

 
package()
{
  #cd "${srcdir}/fdm_materials-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/cura/resources/materials"
  cp -r ${srcdir}/fdm_materials-${pkgver}/*.fdm_material "${pkgdir}/usr/share/cura/resources/materials"
}



#
# EOF
#
