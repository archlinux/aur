# Maintainer: barfin
pkgname=invert-steam-skin
pkgver=353
pkgrel=2
pkgdesc="A light skin for steam"
arch=("any")
url="https://gamebanana.com/guis/28814"
license=('unknown')
depends=("steam" "sssm")
source=("https://files.gamebanana.com/mods/invert_v${pkgver}.zip")
md5sums=('cedaeac2f304a455d7a7a0a9cce0d08c')
install="${pkgname}.install"

package() {
  mkdir -p "${pkgdir}/usr/share/steam/skins"
  cp -r "${srcdir}/Invert" "${pkgdir}/usr/share/steam/skins"
}
