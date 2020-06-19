# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.german
pkgver=1.3
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://sourceforge.net/projects/simutrans/files/PAK128.german/pak128.german_1.3_for_ST_121.0/PAK128.german_1.3_for_ST_121.0.zip)
sha256sums=('d0dff28c8b83184036ad7fdaf7610661e5ff91731f917437fdfd17356bf15538')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.german"
  cp -r simutrans/PAK128.german/* "$pkgdir/usr/share/games/simutrans/pak128.german"
}
