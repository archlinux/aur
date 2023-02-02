# Maintainer: barfin
pkgname=threshold-miku-dark-steam-skin
pkgver=2.6.3
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Dark Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Dark/Threshold.Miku.zip)
md5sums=('72d90a82044fcc77201b4d5ef01cb4c6')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins/threshold-miku-dark
  cp -r ${srcdir}/'Threshold Miku'/* ${pkgdir}/usr/share/steam/skins/threshold-miku-dark
}

