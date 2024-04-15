# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-addon-classic-hd
_pkgname=uqm-megamod
pkgver=0.8.3
pkgrel=1
pkgdesc="Classic HD-mod styled textures and UI for the Ur-Quan Masters MegaMod's HD mode by JHGuitarFreak (Kohr-Ah Death)."
arch=("any")
url="https://sourceforge.net/projects/uqm-mods/"
license=("custom:CC BY-NC-SA 2.5")

depends=("uqm-megamod-addon-hd")

source=(
  "mm-${pkgver}-hd-classic-pack.uqm::https://sourceforge.net/projects/uqm-mods/files/MegaMod/${pkgver}/Content/mm-${pkgver}-hd-classic-pack.uqm"
  "ATTRIBUTION.txt::https://raw.githubusercontent.com/JHGuitarFreak/UQM-MegaMod-Content/master/addons/mm-hd/ATTRIBUTION.txt"
  LICENSE
)

md5sums=(
  "19fdae7ed126cbb067cdfae0954cab6e"
  "ff908319ce20057293c3c350854b390d"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=("mm-${pkgver}-hd.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-hd-classic-pack.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-hd-classic-pack.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ATTRIBUTION.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTION.txt"
}
