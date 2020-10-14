# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.nippon
pkgver=0.4
pkgrel=1
pkgdesc="An alternative japanese low resolution graphics set for Simutrans"
arch=('any')
url="https://www.simutrans.com/"
license=('MIT')
source=(http://github.com/wa-st/pak-nippon/releases/download/v0.4.0/pak.nippon-v0.4.0.zip)
sha256sums=('9f5efada161495c3161d10b99ccd8531c19854fb8ab19b42b5511dc4a84f6a5e')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.nippon"
  cp -r pak.nippon/* "$pkgdir/usr/share/games/simutrans/pak64.nippon"
}
