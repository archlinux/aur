# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase="fantasma"
_pkgbase="Fantasma"
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.1
pkgrel=1
pkgdesc="Fantasma: An 「ael-lab」 Release AEL-01 // Font design by Froyo Tam AEL-01"
arch=('any')
url="https://github.com/froyotam/Fantasma/"
license=('GPLv3')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/froyotam/Fantasma/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6764b40a15ce640aca4eea5b3380a961677eb2c0ac3bc92f5715f3489ec711df')

package_ttf-fantasma() {
  pkgdesc="Fantasma: An 「ael-lab」 Release AEL-01 // Font design by Froyo Tam AEL-01(TTF True Type Font)"
  cd "${_pkgbase}-${pkgver}"
  install -Dm644 fonts/Fantasma-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/Fantasma-Regular.ttf"
}

package_otf-fantasma() {
  pkgdesc="Fantasma: An 「ael-lab」 Release AEL-01 // Font design by Froyo Tam AEL-01(OTF Open Type Font)"
  cd "${_pkgbase}-${pkgver}"
  install -Dm644 fonts/Fantasma-Regular.otf "${pkgdir}/usr/share/fonts/TTF/Fantasma-Regular.otf"
}
