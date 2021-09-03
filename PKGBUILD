# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.german
pkgver=2.1.beta.422
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://pak128-german.de/PAK128.german_VS2.1.beta.zip)
sha256sums=('7aa2cb96cbb04a05fa56d544ef31fec2644b830a601de029bff8c15d3b707d30')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.german"
  cp -r simutrans/PAK128.german*/* "$pkgdir/usr/share/games/simutrans/pak128.german"
}
