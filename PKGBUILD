# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.german
pkgver=2.0
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://sourceforge.net/projects/simutrans/files/PAK128.german/PAK128.german_2.0_for_ST_122.0/PAK128.german_2.0_for_ST_122.0.zip/download)
sha256sums=('473bffff62b8e25a21ab1efbf5d23ac354a21173269512212ff511c2b1fd2d71')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.german"
  cp -r simutrans/PAK128.german/* "$pkgdir/usr/share/games/simutrans/pak128.german"
}
