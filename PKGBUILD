# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak64.contrast
pkgver=102.2
pkgrel=1
pkgdesc="Minimalistic, low resolution graphics set for Simutrans"
arch=('any')
url="https://www.simutrans.com/"
license=('Unknown')
source=(http://downloads.sourceforge.net/project/simutrans/pak64.contrast/pak64.Contrast_910.zip)
sha256sums=('0ae1987b43ae788216510398cb707997207a353e9699e86ec1074e1219cf0e6c')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak64.contrast"
  cp -r pakcontrast/* "$pkgdir/usr/share/games/simutrans/pak64.contrast"

  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
