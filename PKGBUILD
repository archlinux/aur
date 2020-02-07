# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.german
pkgver=112.3.10
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://sourceforge.net/projects/simutrans/files/pak.german/pak64.german-112-3/pak64.german_0-112-3beta6_full.zip/download)
sha256sums=('e9f0a283af6967e32b18e1d1f84287fd54fb2adc48da38a8b784cefe0ecd6c37')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.german"
  cp -r simutrans/pak64.german/* "$pkgdir/usr/share/games/simutrans/pak64.german"
}
