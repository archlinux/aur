# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.german
pkgver=2.2
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://pak128-german.de/PAK128.german_2.2_for_ST_124.0.zip)
sha256sums=('1c2fc0ac905b8e1b97c49c640d8312c962de0952af855fb008f94f1c71e311d3')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.german"
  cp -r simutrans/PAK128.german*/* "$pkgdir/usr/share/games/simutrans/pak128.german"
}
