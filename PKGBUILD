# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak128.cs
pkgver=2019
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans Extended, with a czech theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended')
source=(http://list.extended.simutrans.org/pak128.CS-Ex.zip)
sha256sums=('9aa92704bac599f401a0eb2fb22edccd9d63fb24691573c051959aadc520d52d')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.cs-ex"
  cp -r pak128.CS-Ex/* "$pkgdir/usr/share/games/simutrans-extended/pak128.cs-ex"
}
