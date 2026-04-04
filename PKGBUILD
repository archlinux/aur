# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.german
pkgver=124.0.1
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('Freeware')
source=(http://simutrans-germany.com/pak.german/pak64.german_0-124-4-0-1_full.zip)
sha256sums=('a650ba469d437044636bcc01462f2d3d4d4a032699afd65e8d8d95cde9d1d743')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/simutrans/pak64.german"
  cp -r simutrans/pak64.german/* "$pkgdir/usr/share/simutrans/pak64.german"
}
