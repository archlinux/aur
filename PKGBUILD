# Maintainer: barfin

pkgname=pixelvision2-steam-skin
pkgver=1.1
pkgrel=1
pkgdesc="Pixelvision2 skin for steam"
arch=(any)
url="https://github.com/barfin/Pixelvision2-for-aur"
license=("unknown")
depends=(steam sssm ttf-segoewp)
source=(${url}/archive/refs/tags/${pkgver}.zip)
md5sums=('20f91e4f8711a07bcfd65985e94f4739')
install="${pkgname}.install"

package() {
  mkdir -p ${pkgdir}/usr/share/steam/skins
  mv ${srcdir}/Pixelvision2-for-aur-${pkgver} ${srcdir}/Pixelvision2
  cp -r ${srcdir}/Pixelvision2 ${pkgdir}/usr/share/steam/skins
}

