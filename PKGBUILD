# Maintainer: Roboron <robertoms258 at gmail dot com >
#
# pak128.sweden-extended is in active development - this package is updated nightly

pkgname=simutrans-extended-pak128.sweden
pkgver=20200504
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans Extended, with a swedish theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended')
source=(http://bridgewater-brunel.me.uk/downloads/nightly/pakset/pak128.sweden-ex-nightly.tar.gz)
sha256sums=('d8a5c8af425e7ac0e215c08ac0482408763ffa6786222388b8ca8349c9231542')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.sweden-ex"
  cp -r * "$pkgdir/usr/share/games/simutrans-extended/pak128.sweden-ex"
}
