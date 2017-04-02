# Maintainer: jesuschroist <chris@qlab.pro>

pkgname=ttf-pirata-one
pkgver=1.0
pkgrel=1
pkgdesc="A gothic textura font, simplified and optimized to work well on screen and pixel displays."
arch=('any')
url="http://www.rfuenzalida.com/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.1001freefonts.com/d/5814/pirata_one.zip)
md5sums=('150aae277366407f44abd3340fea58f6')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 PirataOne-Regular.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
