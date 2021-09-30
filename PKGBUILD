# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.nippon
pkgver=0.5
pkgrel=1
pkgdesc="An alternative japanese low resolution graphics set for Simutrans"
arch=('any')
url="https://www.simutrans.com/"
license=('MIT')
source=(http://github.com/wa-st/pak-nippon/releases/download/v0.5.0/pak.nippon-v0.5.0.zip)
sha256sums=('124e1707fcf2fe4617383eba59e6f36d8fb882189786110c6df64ad2e34c61fa')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.nippon"
  cp -r pak.nippon/* "$pkgdir/usr/share/games/simutrans/pak64.nippon"
}
