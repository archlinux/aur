# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Uffe Jakobsen <my first name [at] my first name [dot] org>
 
pkgname=cura-resources-materials
pkgver=5.6.0
pkgrel=1
pkgdesc="Missing materials resources for Cura"
url="https://ultimaker.com/en/products/cura-software"
license=("AGPL")
arch=("any")
source=(fdm_materials-$pkgver.tar.gz::https://github.com/Ultimaker/fdm_materials/archive/${pkgver}.tar.gz)
sha512sums=('f29538bcabc11dec2e562e6b7fe4472e79a7f597430ed7b072d9b55706e9ae219af918df1e5165e9a6bdfdbd3821dc2fd7ccefb62b7846418307102fb5b9d273')

package()
{
  mkdir -p "${pkgdir}"/usr/share/cura/resources/materials
  cp -r "${srcdir}"/fdm_materials-${pkgver}/*.fdm_material "${pkgdir}"/usr/share/cura/resources/materials/
}
