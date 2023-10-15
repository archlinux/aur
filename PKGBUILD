# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.german
pkgver=123.0.0.7
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with a german theme"
arch=('any')
url="https://www.simutrans.com/"
license=('Freeware')
source=(https://simutrans-germany.com/pak.german/pak64.german_0-123-0-0-7_full.zip)
sha256sums=('f248225bd61e8c0dcb55bdbc244a09c936da3a3c9038e3d92dfc7533b1841382')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.german"
  cp -r simutrans/pak64.german/* "$pkgdir/usr/share/games/simutrans/pak64.german"
}
