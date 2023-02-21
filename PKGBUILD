# Maintainer:  RogueGirl <3a33oxx40 at mozmail dot com>

pkgname=threshold-miku-dark-steam-skin
pkgver=2.7.1
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Dark Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Dark/Threshold.Miku.zip)
md5sums=('b9287a3d55ccb711e65ea6e89d10979d')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins/threshold-miku-dark
  cp -r ${srcdir}/'Threshold Miku'/* ${pkgdir}/usr/share/steam/skins/threshold-miku-dark
}

