# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Uffe Jakobsen <my first name [at] my first name [dot] org>
 
pkgname=cura-resources-materials
pkgver=5.7.0
pkgrel=1
pkgdesc="Missing materials resources for Cura"
url="https://ultimaker.com/en/products/cura-software"
license=("AGPL")
arch=("any")
source=(fdm_materials-$pkgver.tar.gz::https://github.com/Ultimaker/fdm_materials/archive/${pkgver}.tar.gz)
sha512sums=('f08e0acbf7ee69f07e872f060d82450873ccb0de6c1e0b71c256d83be4ea5e32309ab883be93ef3c8efb1315cec4e3424d892f5a75b14be4b99d0773c9b6799d')

package()
{
  mkdir -p "${pkgdir}"/usr/share/cura/resources/materials
  cp -r "${srcdir}"/fdm_materials-${pkgver}/*.fdm_material "${pkgdir}"/usr/share/cura/resources/materials/
}
