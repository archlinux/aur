# Maintainer: barfin
pkgname=threshold-miku-dark-steam-skin
pkgver=2.3.6
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Dark Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Dark/Threshold.Miku.zip)
md5sums=('3d0be10a22c33c9d5eb91445c5987553')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/Threshold\ Miku ${srcdir}/threshold-miku-dark
  cp -r ${srcdir}/threshold-miku-dark ${pkgdir}/usr/share/steam/skins
}

