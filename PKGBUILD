# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Uffe Jakobsen <my first name [at] my first name [dot] org>
 
pkgname=cura-resources-materials
pkgver=5.0.0
pkgrel=1
pkgdesc="Missing materials resources for Cura"
url="https://ultimaker.com/en/products/cura-software"
license=("AGPL")
arch=("any")
source=(fdm_materials-$pkgver.tar.gz::https://github.com/Ultimaker/fdm_materials/archive/${pkgver}.tar.gz)
sha512sums=('88c8bb7c578cedb3dd9239644bc3b0bede7a600dee56979bc32a3861b541af55850384bd0f64cd619b0fac8e3e9f09f9aeb00ca0662e7f96fb2791c3d2b1e31b')

package()
{
  mkdir -p "${pkgdir}"/usr/share/cura/resources/materials
  cp -r "${srcdir}"/fdm_materials-${pkgver}/*.fdm_material "${pkgdir}"/usr/share/cura/resources/materials/
}
