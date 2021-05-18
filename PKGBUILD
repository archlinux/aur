# Maintainer: barfin
pkgname=threshold-miku-dark-steam-skin
pkgver=2.3.5
pkgrel=1
pkgdesc=" A Hatsune Miku Steam Theme Skin with Steam New Library Supported!(Dark Version)"
arch=(any)
url="https://github.com/Jack-Myth/Threshold-Miku"
license=("unknown")
depends=(steam sssm)
source=(${url}/releases/download/v${pkgver}-Dark/Threshold-Miku-master.zip)
md5sums=('43a033238a9d5d69ba897df4fc185fc5')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/Threshold-Miku-master ${srcdir}/threshold-miku-dark
  cp -r ${srcdir}/threshold-miku-dark ${pkgdir}/usr/share/steam/skins
}

