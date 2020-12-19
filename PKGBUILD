# Maintainer: barfin
pkgname=invert-steam-skin
pkgver=352
pkgrel=1
pkgdesc="A light skin for steam"
arch=("any")
url="https://gamebanana.com/guis/28814"
license=('unknown')
depends=("steam" "sssm")
source=("https://files.gamebanana.com/guis/invert_v${pkgver}.zip")
md5sums=('c140dc7ce0835c314efef98ee13d480f')
install="${pkgname}.install"

package() {
  mkdir -p "${pkgdir}/usr/share/steam/skins"
  cp -r "${srcdir}/Invert" "${pkgdir}/usr/share/steam/skins"
}
