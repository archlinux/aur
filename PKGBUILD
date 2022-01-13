# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

DLAGENTS=('https::/usr/bin/curl -gqb "" -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=uqm-megamod-addon-vols-remix
_pkgname=uqm-megamod
pkgver=0.8.1
pkgrel=1
pkgdesc="Volasaurus' complete remix Pack for the Ur-Quan Masters MegaMod by Serosis."
arch=("any")
url="https://github.com/Serosis/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-vols-remix.uqm::https://files.serosis.net/MegaMod/${pkgver}/mm-${pkgver}-vols-remix.uqm"
  "LICENSE.txt::https://raw.githubusercontent.com/Serosis/UQM-MegaMod-Content/master/addons/volasaurus-remix-pack/LICENSE.txt"
  LICENSE
)

md5sums=(
  "75c92755fa6ad0818659fa58cea1d995"
  "98782edfae5a7e1c54422d1d7759e22c"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=("mm-${pkgver}-vols-remix.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-vols-remix.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-vols-remix.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
