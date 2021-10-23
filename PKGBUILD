# Maintainer: barfin
pkgname=threshold-miku-dark-steam-skin
pkgver=2.4.2
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Dark Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Dark/Threshold-Miku.zip)
md5sums=('1de0c9d5c1a780986873a47c541ad4fe')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins/threshold-miku-dark
  cp -r ${srcdir}/* ${pkgdir}/usr/share/steam/skins/threshold-miku-dark
}

