# Maintainer: barfin
pkgname=compact-steam-skin
pkgver=1.6.53
pkgrel=1
pkgdesc="A compact skin for steam"
arch=("any")
url="https://github.com/badanka/Compact"
license=('unknown')
depends=("steam" "sssm")
source=("${url}/archive/${pkgver}.zip")
md5sums=('9109ad069130c16a3641ac4a23bcabbe')
install="${pkgname}.install"

package() {
  mkdir -p "${pkgdir}/usr/share/steam/skins"
  mv "${srcdir}/Compact-${pkgver}" "${srcdir}/Compact"
  cp -r "${srcdir}/Compact" "${pkgdir}/usr/share/steam/skins"
}
