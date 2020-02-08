# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.cs
pkgver=2019
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a czech theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(http://list.extended.simutrans.org/pak128.CS.zip)
sha256sums=('dca8d7ff2b245c5543cb0024b30ea93ac6892971d829501d88f833913686bfe2')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.cs"
  cp -r pak128.CS/* "$pkgdir/usr/share/games/simutrans/pak128.cs"
}
