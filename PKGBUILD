# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak128.cs
pkgver=2019
pkgrel=2
pkgdesc="High resolution graphics set for Simutrans Extended, with a czech theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended-git')
source=(https://files.michan.es/simutrans/pak128.CS-Ex.zip)
sha256sums=('e4a34095aaa1c53813baf2b699b872cb6c14a9b8d9f97f5e9c23cf36efdf21fb')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.cs-ex"
  cp -r pak128.CS-Ex/* "$pkgdir/usr/share/games/simutrans-extended/pak128.cs-ex"
}
