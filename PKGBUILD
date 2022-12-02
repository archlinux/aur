# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Uffe Jakobsen <my first name [at] my first name [dot] org>
 
pkgname=cura-resources-materials
pkgver=5.2.0
pkgrel=1
pkgdesc="Missing materials resources for Cura"
url="https://ultimaker.com/en/products/cura-software"
license=("AGPL")
arch=("any")
source=(fdm_materials-$pkgver.tar.gz::https://github.com/Ultimaker/fdm_materials/archive/${pkgver}.tar.gz)
sha512sums=('b3f1d97197f604d4aff454fab7a794bd101dfa309d0a67325f1e5ac1ecc90cc80e4b9cd8d41a0fc7d76b87feef910bd5d8962fb0222383c6370bf08b8c1ba4ed')

package()
{
  mkdir -p "${pkgdir}"/usr/share/cura/resources/materials
  cp -r "${srcdir}"/fdm_materials-${pkgver}/*.fdm_material "${pkgdir}"/usr/share/cura/resources/materials/
}
