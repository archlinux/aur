# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.japan
pkgver=120
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a japan theme"
arch=('any')
url="https://www.simutrans.com/"
license=('GPL')
source=(http://pak128.jpn.org/souko/pak128.japan.120.0.cab)
sha256sums=('7493a9615761e799879b7902281c254a1977fba23f4d1040903ee2be8148d472')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.japan"
  cp -r pak128.japan/* "$pkgdir/usr/share/games/simutrans/pak128.japan"
}
