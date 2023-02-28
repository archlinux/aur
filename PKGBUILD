# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.nippon
pkgver=0.6.2
pkgrel=1
pkgdesc="An alternative japanese low resolution graphics set for Simutrans"
arch=('any')
url="https://www.simutrans.com/"
license=('MIT')
source=(http://github.com/wa-st/pak-nippon/releases/download/v$pkgver/pak.nippon-v$pkgver.zip)
sha256sums=('ce42d68960c42e2092cc5498f9a64eafe07cab36e56cf0df6c19ed60c5a120c3')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.nippon"
  cp -r pak.nippon/* "$pkgdir/usr/share/games/simutrans/pak64.nippon"
}
