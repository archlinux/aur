# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak32.comic
pkgver=102.0
pkgrel=1
pkgdesc="Lowest resolution graphics set for Simutrans"
arch=('any')
url="https://www.simutrans.com/"
license=('Unknown')
source=(http://downloads.sourceforge.net/project/simutrans/pak32.comic/pak32.comic%20for%20102-0/pak32.comic_102-0.zip)
sha256sums=('da937cb9e086095ee4c1b2529d0b6095be6ae1a28eb29db578caac53d5050e68')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak32.comic"
  cp -r simutrans/pak32/* "$pkgdir/usr/share/games/simutrans/pak32.comic"
}
