# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.ho-scale
pkgver=0.1
pkgrel=1
pkgdesc="Resolution graphics set for Simutrans for model train fans"
arch=('any')
url="https://www.simutrans.com/"
license=('GPLv3')
source=(http://simutrans.bilkinfo.de/pak64.ho-scale-latest.tar.gz)
sha256sums=('0f449c1905f7ddf4fb55eb032cbda6d8d2d670b209a47ce0a3bded7b3f283ade')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.ho-scale"
  cp -r pak64.ho-scale/* "$pkgdir/usr/share/games/simutrans/pak64.ho-scale"
}
