# Maintainer: Roberto Michán Sánchez <robertoms258 at gmail dot com >
#
# pak128.britain-extended is in active development - this package is updated nightly

pkgname=simutrans-extended-pak128.britain
pkgver=20200204
pkgrel=1
pkgdesc="Simutrans Extended graphic set, with a British theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended')
source=(http://bridgewater-brunel.me.uk/downloads/nightly/pakset/pak128.britain-ex-nightly.tar.gz
        license.txt)
sha256sums=('SKIP'
            'SKIP')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.britain"
  cp -r * "$pkgdir/usr/share/games/simutrans-extended/pak128.britain"
  
  #license
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/simutrans-extended-pak128.britain/license.txt"
}
