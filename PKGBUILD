# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-addon-vols-remix
_pkgname=uqm-megamod
pkgver=0.8.3
pkgrel=1
pkgdesc="Volasaurus' complete remix Pack for the Ur-Quan Masters MegaMod by JHGuitarFreak (Kohr-Ah Death)."
arch=("any")
url="https://sourceforge.net/projects/uqm-mods/"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-volasaurus-remix-pack.uqm::https://sourceforge.net/projects/uqm-mods/files/MegaMod/${pkgver}/Content/mm-${pkgver}-volasaurus-remix-pack.uqm"
  "mm-vols-space.uqm::https://sourceforge.net/projects/uqm-mods/files/MegaMod/${pkgver}/Content/mm-vols-space.uqm"
  "LICENSE.txt::https://raw.githubusercontent.com/Serosis/UQM-MegaMod-Content/master/addons/volasaurus-remix-pack/LICENSE.txt"
  LICENSE
)

md5sums=(
  "64454c913887d8c81739f9e5279c714e"
  "11648eebe97faad910c5714eb47c9f49"
  "98782edfae5a7e1c54422d1d7759e22c"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=(
  "mm-${pkgver}-volasaurus-remix-pack.uqm"
  "mm-vols-space.uqm"
)

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-volasaurus-remix-pack.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-volasaurus-remix-pack.uqm"
  install -Dm644 "${srcdir}/mm-vols-space.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-vols-space.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
