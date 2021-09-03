# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-addon-vols-remix
_pkgname=uqm-megamod
pkgver=0.8.0.85
pkgrel=1
pkgdesc="Volasaurus' complete remix Pack for the Ur-Quan Masters MegaMod by Serosis."
arch=("any")
url="https://github.com/yokai-shogun/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "https://github.com/yokai-shogun/UQM-MegaMod-Content/releases/download/${pkgver}/mm-${pkgver}-vols-remix.uqm"
  "https://raw.githubusercontent.com/yokai-shogun/UQM-MegaMod-Content/master/LICENSE"
  "https://raw.githubusercontent.com/yokai-shogun/UQM-MegaMod-Content/master/addons/volasaurus-remix-pack/LICENSE.txt"
)

md5sums=(
  "8b7b1230bf83914c9877443197efcebd"
  "4f30efe3d129bd9a8bddd0d455c849f7"
  "98782edfae5a7e1c54422d1d7759e22c"
)

noextract=("mm-${pkgver}-vols-remix.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-vols-remix.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-vols-remix.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
