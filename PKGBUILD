# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak128.britain
pkgver=0.17
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a british theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(http://sourceforge.net/projects/simutrans/files/pak128.britain/pak128.Britain%20for%20120-1/pak128.Britain.1.17-120-1.zip)
sha256sums=('25d3ce7acefa0b1b18a4a71e71c0eeed80c34eacd51a81ecb009b2fd23e671db')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak128.britain"
  cp -r pak128.Britain/* "$pkgdir/usr/share/games/simutrans/pak128.britain"
}
