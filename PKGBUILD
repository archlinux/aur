# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.nippon
pkgver=0.3
pkgrel=1
pkgdesc="An alternative japanese low resolution graphics set for Simutrans"
arch=('any')
url="https://www.simutrans.com/"
license=('MIT')
source=(http://github.com/wa-st/pak-nippon/releases/download/v0.3.0/pak.nippon-v0.3.0.zip)
sha256sums=('37c51859dc5841ee4d9424b159b9cc7ab23da015cff49e28573b23a640e9a796')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.nippon"
  cp -r pak.nippon/* "$pkgdir/usr/share/games/simutrans/pak64.nippon"
}
