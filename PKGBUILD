# Maintainer : Ville Aakko <wpenguin <AT> kapsi DOT fi>
# Contributor : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-addon-hd
_pkgname=uqm-megamod
pkgver=0.8.4
pkgrel=1
pkgdesc="HD Graphics package for the Ur-Quan Masters MegaMod by JHGuitarFreak (Kohr-Ah Death)."
arch=("any")
url="https://sourceforge.net/projects/uqm-mods/"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-hd-content.uqm::https://sourceforge.net/projects/uqm-mods/files/MegaMod/${pkgver}/Content/mm-${pkgver}-hd-content.uqm/download"
  "mm-remix-timing.uqm::https://sourceforge.net/projects/uqm-mods/files/MegaMod/${pkgver}/Content/mm-remix-timing.uqm/download"
  "ATTRIBUTION.txt::https://raw.githubusercontent.com/JHGuitarFreak/UQM-MegaMod-Content/master/addons/mm-hd/ATTRIBUTION.txt"
  LICENSE
)

md5sums=('75c920bbe71915e2854681f27f8c110e'
         'ae352d8495d4f4fcac6be81940584f81'
         'ff908319ce20057293c3c350854b390d'
         '4f30efe3d129bd9a8bddd0d455c849f7')

noextract=("mm-${pkgver}-hd-content.uqm"
           "mm-remix-timing.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-hd-content.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-hd-content.uqm"
  install -Dm644 "${srcdir}/mm-remix-timing.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-remix-timing.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ATTRIBUTION.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTION.txt"
}
