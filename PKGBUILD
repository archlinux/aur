# Maintainer: Andreas Tennert <mail at andreas-tennert dot de>
pkgname='lcarsde-onboard-theme'
pkgver=23.1
pkgrel=1
pkgdesc="LCARS like theme for onboard for LCARSDE"
arch=('any')
url="https://lcarsde.github.io"
license=('MIT')
groups=('lcarsde')
depends=('onboard')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lcarsde/lcarsde-onboard-theme/archive/$pkgver.tar.gz")
md5sums=('b1a63fceced945a5c8692c5587894ecb')

package() {
  cd "lcarsde-onboard-theme-$pkgver"

  mkdir -p "$pkgdir/usr/share/onboard/themes"
  cp -r "LCARS.theme" "$pkgdir/usr/share/onboard/themes/"
  cp -r "LCARS.colors" "$pkgdir/usr/share/onboard/themes/"
}
