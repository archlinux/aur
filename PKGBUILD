# Maintainer: barfin
pkgname=threshold-miku-light-steam-skin
pkgver=2.4.2
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Light Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Light/Threshold-Miku-Light.zip)
md5sums=('5dd15215e5ff761fb25b6f433ae81466')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins/threshold-miku-light
  cp -r ${srcdir}/* ${pkgdir}/usr/share/steam/skins/threshold-miku-light
}

