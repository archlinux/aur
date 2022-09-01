# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Uffe Jakobsen <my first name [at] my first name [dot] org>
 
pkgname=cura-resources-materials
pkgver=4.13.0
pkgrel=1
pkgdesc="Missing materials resources for Cura"
url="https://ultimaker.com/en/products/cura-software"
license=("AGPL")
arch=("any")
source=(fdm_materials-$pkgver.tar.gz::https://github.com/Ultimaker/fdm_materials/archive/${pkgver}.tar.gz)
sha1sums=('25ed117131973e4c2ac942b4daf6914f401a6bb4')

package()
{
  mkdir -p "${pkgdir}"/usr/share/cura/resources/materials
  cp -r "${srcdir}"/fdm_materials-${pkgver}/*.fdm_material "${pkgdir}"/usr/share/cura/resources/materials/
}
