# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase="fantasma"
_pkgbase="Fantasma"
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.0
pkgrel=1
pkgdesc="Fantasma: An 「ael-lab」 Release AEL-01 // Font design by Froyo Tam AEL-01"
arch=('any')
url="https://github.com/froyotam/ferrite-core/"
license=('GPLv3')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/froyotam/Fantasma/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c6965ab7d12117026e48738f50a61f7e9c54dacc918bb515afa55326d5ef8522')

package_ttf-fantasma() {
  pkgdesc="Fantasma: An 「ael-lab」 Release AEL-01 // Font design by Froyo Tam AEL-01(TTF True Type Font)"
  cd "${_pkgbase}-${pkgver}"
  install -Dm644 fonts/Fantasma-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/Fantasma-Regular.ttf"
}

package_otf-fantasma() {
  pkgdesc="Fantasma: An ael-lab Release AEL-01 // Font design by Froyo Tam AEL-01(OTF Open Type Font)"
  cd "${_pkgbase}-${pkgver}"
  install -Dm644 fonts/Fantasma-Regular.otf "${pkgdir}/usr/share/fonts/TTF/Fantasma-Regular.otf"
}
