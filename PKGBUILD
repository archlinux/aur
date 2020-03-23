# Maintainer: Roboron <robertoms258 at gmail dot com >
#
# pak128.sweden-extended is in active development - this package is updated nightly

pkgname=simutrans-extended-pak128.sweden
pkgver=20200323
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans Extended, with a swedish theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended')
source=(http://bridgewater-brunel.me.uk/downloads/nightly/pakset/pak128.sweden-ex-nightly.tar.gz)
sha256sums=('SKIP')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.sweden-ex"
  cp -r * "$pkgdir/usr/share/games/simutrans-extended/pak128.sweden-ex"
}
