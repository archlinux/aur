# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

DLAGENTS=('https::/usr/bin/curl -gqb "" -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=uqm-megamod-addon-sol-textures
_pkgname=uqm-megamod
pkgver=0.8.1
pkgrel=1
pkgdesc="Improved textures for the planets in the Sol System for the Ur-Quan Masters MegaMod by Serosis."
arch=("any")
url="https://github.com/Serosis/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-sol-textures.uqm::https://files.serosis.net/MegaMod/${pkgver}/mm-${pkgver}-sol-textures.uqm"
  LICENSE
)

md5sums=(
  "d6c19401e94c826a4a5c7b92758a681b"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=("mm-${pkgver}-sol-textures.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-sol-textures.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-sol-textures.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
