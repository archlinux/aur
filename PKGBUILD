# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.nippon
pkgver=0.6.0
pkgrel=1
pkgdesc="An alternative japanese low resolution graphics set for Simutrans"
arch=('any')
url="https://www.simutrans.com/"
license=('MIT')
source=(http://github.com/wa-st/pak-nippon/releases/download/v$pkgver/pak.nippon-v$pkgver.zip)
sha256sums=('049201013cc56b2b5b02226f836f33cf047a76fab792f999ab25b37642baecc1')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.nippon"
  cp -r pak.nippon/* "$pkgdir/usr/share/games/simutrans/pak64.nippon"
}
