# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.german
pkgver=120
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(http://sourceforge.net/projects/simutrans/files/PAK128.german/pak128.german_1.2_for_ST_121.0/PAK128.german_1.2_for_ST_121-0.zip)
sha256sums=('f1a95dfdf27951614e07196e6a5d03e4e02b55bd83fdb06bd85e8045fe64b2cb')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.german"
  cp -r simutrans/PAK128.german/* "$pkgdir/usr/share/games/simutrans/pak128.german"
}
