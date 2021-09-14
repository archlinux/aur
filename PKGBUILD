# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.german
pkgver=2.1.beta.422
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://pak128-german.de/PAK128.german_VS2.1.beta.zip)
sha256sums=('0fdbc03d9ad71a76f377c074486ffe9215a068d0011b5606c4518eaee9b680ea')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.german"
  cp -r simutrans/PAK128.german*/* "$pkgdir/usr/share/games/simutrans/pak128.german"
}
