# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Uffe Jakobsen <my first name [at] my first name [dot] org>
 
pkgname=cura-resources-materials
pkgver=5.1.0
pkgrel=1
pkgdesc="Missing materials resources for Cura"
url="https://ultimaker.com/en/products/cura-software"
license=("AGPL")
arch=("any")
source=(fdm_materials-$pkgver.tar.gz::https://github.com/Ultimaker/fdm_materials/archive/${pkgver}.tar.gz)
sha512sums=('fc2d6e9c0fd20e8c113aca400d6b19dcec338e77bc75f19bac7771a6e7e67df5b0277a8f7021fa45b890643901719d5adb17f7cfa1a41b074af7463d4662c9c3')

package()
{
  mkdir -p "${pkgdir}"/usr/share/cura/resources/materials
  cp -r "${srcdir}"/fdm_materials-${pkgver}/*.fdm_material "${pkgdir}"/usr/share/cura/resources/materials/
}
