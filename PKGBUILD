# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-addon-sol-textures
_pkgname=uqm-megamod
pkgver=0.8.0.85
pkgrel=1
pkgdesc="Sol Textures for the Ur-Quan Masters MegaMod by Serosis."
arch=("any")
url="https://github.com/yokai-shogun/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "https://github.com/yokai-shogun/UQM-MegaMod-Content/releases/download/${pkgver}/mm-${pkgver}-sol-textures.uqm"
  "https://raw.githubusercontent.com/yokai-shogun/UQM-MegaMod-Content/master/LICENSE"
)

md5sums=(
  "5915c8d811345f1a27632c30190768f7"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=("mm-${pkgver}-sol-textures.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-sol-textures.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-sol-textures.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
