# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.german
pkgver=2.1.beta
pkgrel=2
pkgdesc="High resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://pak128-german.de/PAK128.german_VS2.1.beta.zip)
sha256sums=('75a018475e5e377477a4936e9929dd67881869ba72fd0f5341666b05333b9704')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.german"
  cp -r simutrans/PAK128.german*/* "$pkgdir/usr/share/games/simutrans/pak128.german"
}
