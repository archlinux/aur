# Maintainer: barfin
pkgname=threshold-miku-light-steam-skin
pkgver=2.6.3
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Light Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Light/Threshold.Miku.Light.zip)
md5sums=('371d5f396f3c51d52bb2e4b690629f25')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins/threshold-miku-light
  cp -r ${srcdir}/'Threshold Miku Light'/* ${pkgdir}/usr/share/steam/skins/threshold-miku-light
}

