# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-addon-hd
_pkgname=uqm-megamod
pkgver=0.8.2
pkgrel=1
pkgdesc="HD Graphics package for the Ur-Quan Masters MegaMod by JHGuitarFreak (Kohr-Ah Death)."
arch=("any")
url="https://github.com/JHGuitarFreak/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-hd.uqm::https://versaweb.dl.sourceforge.net/project/uqm-mods/MegaMod/${pkgver}/Content/mm-${pkgver}-hd.uqm"
  "ATTRIBUTION.txt::https://raw.githubusercontent.com/JHGuitarFreak/UQM-MegaMod-Content/master/addons/mm-hd/ATTRIBUTION.txt"
  LICENSE
)

md5sums=(
  "37d1918188df4c60f9f1bb2b0a273e00"
  "ff908319ce20057293c3c350854b390d"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=("mm-${pkgver}-hd.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-hd.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-hd.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ATTRIBUTION.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTION.txt"
}
