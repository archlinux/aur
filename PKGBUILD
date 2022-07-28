# Maintainer: barfin
pkgname=threshold-miku-dark-steam-skin
pkgver=2.5.1
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Dark Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Dark/Threshold.Miku.zip)
md5sums=('224472e237d59fbe6599e9bfedb725f6')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins/threshold-miku-dark
  cp -r ${srcdir}/'Threshold Miku'/* ${pkgdir}/usr/share/steam/skins/threshold-miku-dark
}

