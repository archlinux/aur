# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak48.excentrique
pkgver=0.19.RC2
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with an eccentric theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://github.com/Varkalandar/pak48.Excentrique/releases/download/v0.19_RC2/pak48.Excentrique-0.19_RC2.zip)
sha256sums=('a8030f49727359db382139bc6cc1e3afae8df9f9b6d56d6124f17921d866df26')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak48.excentrique"
  cp -r pak48.Excentrique/* "$pkgdir/usr/share/games/simutrans/pak48.excentrique"
}
