# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak128.britain
pkgver=r3889.82e590a85
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans Extended, with a British theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended-git')
source=(http://bridgewater-brunel.me.uk/downloads/nightly/pakset/pak128.britain-ex-nightly.tar.gz
        license.txt)
sha256sums=('f1ed62e521b475721d0a24337306ffb9b5eb5fa5f917094594738d51c3b5b422'
            'def758cfe51b6f16d838f777a6540163fb47f334df5a0fb86448f92a36a92017')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.britain-ex"
  cp -r * "$pkgdir/usr/share/games/simutrans-extended/pak128.britain-ex"
  
  #license
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/simutrans-extended-pak128.britain/license.txt"
}
