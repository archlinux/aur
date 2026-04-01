# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.german
pkgver=2.4
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://pak128-german.de/PAK128.german_2.4_for_ST_124.3.1.zip)
sha256sums=('6bd60912502d1be8bb38426aa6777ca14ae7dbc66369d8ba8878686459af8656')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/simutrans/pak128.german"
  cp -r simutrans/PAK128.german*/* "$pkgdir/usr/share/simutrans/pak128.german"
}
