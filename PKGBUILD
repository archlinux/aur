# Maintainer: barfin
pkgname=invert-steam-skin
pkgver=356
pkgrel=1
pkgdesc="A light skin for steam"
arch=("any")
url="https://gamebanana.com/guis/28814"
license=('unknown')
depends=("steam" "sssm")
source=("https://files.gamebanana.com/mods/invert_v${pkgver}.zip")
md5sums=('c93c7cd99c11a8b00bc9ae1cc98d6215')
install="${pkgname}.install"

package() {
  mkdir -p "${pkgdir}/usr/share/steam/skins"
  cp -r "${srcdir}/Invert" "${pkgdir}/usr/share/steam/skins"
}
