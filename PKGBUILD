# Maintainer: barfin

pkgname=pixelvision2-steam-skin
pkgver=1.0
pkgrel=1
pkgdesc="Pixelvision2 skin for steam"
arch=(any)
url="https://github.com/barfin/Pixelvision2-for-aur"
license=("unknown")
depends=(steam sssm ttf-segoewp)
source=(${url}/archive/refs/tags/${pkgver}.zip)
md5sums=('312f8ea7ff87cb63ad701c0aeb199f4b')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/Pixelvision2-for-aur-${pkgver} ${srcdir}/Pixelvision2
  cp -r ${srcdir}/Pixelvision2 ${pkgdir}/usr/share/steam/skins
}

