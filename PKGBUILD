# Maintainer: Roboron <robertoms258 at gmail dot com >
#
# pak128.britain-extended is in active development - this package is updated nightly

pkgname=simutrans-extended-pak128.britain
pkgver=20200319
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans Extended, with a British theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended')
source=(http://bridgewater-brunel.me.uk/downloads/nightly/pakset/pak128.britain-ex-nightly.tar.gz
        license.txt)
sha256sums=('SKIP'
            'def758cfe51b6f16d838f777a6540163fb47f334df5a0fb86448f92a36a92017')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.britain-ex"
  cp -r * "$pkgdir/usr/share/games/simutrans-extended/pak128.britain-ex"
  
  #license
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/simutrans-extended-pak128.britain/license.txt"
}
