# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.britain
pkgver=1.18.120.3
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a british theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(https://sourceforge.net/projects/simutrans/files/pak128.britain/pak128.Britain%20for%20120-3/pak128.Britain.1.18-120-3.zip/download)
sha256sums=('a3853c240384c4310fda832f4a6438ad9cee0d08c9d2f6416e5bfb498a06cbcf')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.britain"
  cp -r simutrans/pak128.Britain/* "$pkgdir/usr/share/games/simutrans/pak128.britain"
}
