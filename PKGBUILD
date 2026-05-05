# Maintainer : Ville Aakko <wpenguin <AT> kapsi DOT fi>
# Contributor : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-addon-sol-textures
_pkgname=uqm-megamod
pkgver=0.8.4
pkgrel=1
pkgdesc="Improved textures for the planets in the Sol System for the Ur-Quan Masters MegaMod by JHGuitarFreak (Kohr-Ah Death)."
arch=("any")
url="https://sourceforge.net/projects/uqm-mods/"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-sol-textures.uqm::https://sourceforge.net/projects/uqm-mods/files/MegaMod/${pkgver}/Content/mm-${pkgver}-sol-textures.uqm/download"
  LICENSE
)

md5sums=('f49cc966173735c52ff42af81bcbb750'
         '4f30efe3d129bd9a8bddd0d455c849f7')

noextract=("mm-sol-textures.uqm")

package() {
  install -Dm644 "${srcdir}/mm-sol-textures.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-sol-textures.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
