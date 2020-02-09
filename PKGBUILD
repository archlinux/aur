# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.classic
pkgver=1.05
pkgrel=1
pkgdesc="Resolution graphics set for Simutrans, resembling the original"
arch=('any')
url="https://www.simutrans.com/"
license=('Unknown')
source=(https://sourceforge.net/projects/simutrans/files/pakHAJO/pakHAJO_102-2-2/pakHAJO_24x24_0-102-2-2.zip)
sha256sums=('44f655900f18a6cbb8b501ec1d836e05ddee5b8d7fcb1360a7a56c3d909f5776')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.classic"
  cp -r simutrans/pakHAJO_24x24/* "$pkgdir/usr/share/games/simutrans/pak64.classic"
}
