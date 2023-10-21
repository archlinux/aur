# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak128.britain
pkgver=r4433.db7f0c7b5
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans Extended, with a British theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended')
source=(http://bridgewater-brunel.me.uk/downloads/nightly/pakset/pak128.britain-ex-nightly.tar.gz)
sha256sums=('SKIP')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.britain-ex"
  cp -r * "$pkgdir/usr/share/games/simutrans-extended/pak128.britain-ex"
  
  #license
  pwd
  install -Dm644 licence.txt "$pkgdir/usr/share/licenses/simutrans-extended-pak128.britain/license.txt"
}
