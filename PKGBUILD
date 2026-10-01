# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.german
pkgver=124.5.1.1
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('Freeware')
source=(https://simutrans-germany.com/pak.german/pak64.german_0-124-5-1-1_full.zip)
sha256sums=('f48dcb7e53aa02c4acecb54f4a2208f08a471e05794dfc05b69ed575d1ccfd6d')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/simutrans/pak64.german"
  cp -r simutrans/pak64.german/* "$pkgdir/usr/share/simutrans/pak64.german"
}
