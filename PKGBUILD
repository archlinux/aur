# Maintainer: barfin
pkgname=threshold-miku-dark-steam-skin
pkgver=2.4.0
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Dark Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Dark/Threshold.Miku.zip)
md5sums=('5de19b7477616ffaeb56f01a87153bc9')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/Threshold\ Miku ${srcdir}/threshold-miku-dark
  cp -r ${srcdir}/threshold-miku-dark ${pkgdir}/usr/share/steam/skins
}

