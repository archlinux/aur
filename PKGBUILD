# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.german
pkgver=120.4.1.3.beta
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('Freeware')
source=(https://simutrans-germany.com/pak.german/pak64.german_0-120-4-1-3_full.zip)
sha256sums=('a46f0b35e1291a673f0b6f577e70b342a17b44cf37de26ab4fdfa24f8cea34b0')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.german"
  cp -r simutrans/pak64.german/* "$pkgdir/usr/share/games/simutrans/pak64.german"
}
