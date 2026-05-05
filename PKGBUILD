# Maintainer : Ville Aakko <wpenguin <AT> kapsi DOT fi>
# Contributor : Victor Savcenco <victor dot sav at linux dot com>
#   ( ^  from -addon-3do which I used as a base for this PKGBUILD)


pkgname=uqm-megamod-addon-dos
pkgver=0.8.4
pkgrel=1
pkgdesc="DOS mode addon"
arch=("any")
url="https://sourceforge.net/projects/uqm-mods/"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-dosmode.uqm::https://sourceforge.net/projects/uqm-mods/files/MegaMod/${pkgver}/Content/mm-${pkgver}-dosmode.uqm/download"
  LICENSE
)

md5sums=('2ef31f349b5012e122ae77435a49074a'
         '4f30efe3d129bd9a8bddd0d455c849f7')

noextract=(
  "mm-${pkgver}-dosmode.uqm"
)

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-dosmode.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-dosmode.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
