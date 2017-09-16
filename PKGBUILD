# Maintainer: Jordi Pakey-Rodriguez <me@jordi.codes>

pkgname=ttf-material-design-icons
_pkgname=material-design-icons
pkgver=3.0.1
pkgrel=1
pkgdesc="Material Design icons by Google"
arch=('any')
url="http://google.github.io/material-design-icons/"
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/google/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('b25cf06c66f87fc9ff7fa81213c8f725dfc268027f8cc8b6366e9a9cd41f1105')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$_pkgname-$pkgver/iconfont/MaterialIcons-Regular.ttf" "$pkgdir/usr/share/fonts/TTF/MaterialIcons-Regular.ttf"
}
