# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.german
pkgver=123.0.0.1
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('Freeware')
source=(https://simutrans-germany.com/pak.german/pak64.german_0-123-0-0-1_full.zip)
sha256sums=('20e54239a1b160dada8c439d489870e67efb2fc6862691d85baa484f6cee5fd5')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.german"
  cp -r simutrans/pak64.german/* "$pkgdir/usr/share/games/simutrans/pak64.german"
}
