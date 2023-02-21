# Maintainer:  RogueGirl <3a33oxx40 at mozmail dot com>

pkgname=threshold-miku-light-steam-skin
pkgver=2.7.1
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Light Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Light/Threshold.Miku.Light.zip)
md5sums=('ab8b39bb8a5afac36d6699736de90999')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins/threshold-miku-light
  cp -r ${srcdir}/'Threshold Miku Light'/* ${pkgdir}/usr/share/steam/skins/threshold-miku-light
}

