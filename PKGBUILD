# Maintainer: barfin
pkgname=threshold-miku-light-steam-skin
pkgver=2.5.1
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Light Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Light/Threshold.Miku.Light.zip)
md5sums=('f58aba3d975a11a86a3877bbe20501f8')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins/threshold-miku-light
  cp -r ${srcdir}/'Threshold Miku Light'/* ${pkgdir}/usr/share/steam/skins/threshold-miku-light
}

