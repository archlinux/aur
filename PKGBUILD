# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.scifi
pkgver=0.2
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with a SciFi theme"
arch=('any')
url="https://www.simutrans.com/"
license=('Unknown')
source=(http://sourceforge.net/projects/simutrans/files/pak64.scifi/pak64.scifi_112.x_v0.2.zip)
sha256sums=('d07a7b496d944579ecf918e2204c8a9f827d896f68260630b2ad304e812e357a')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.scifi"
  cp -r simutrans/pak64.scifi/* "$pkgdir/usr/share/games/simutrans/pak64.scifi"
}
