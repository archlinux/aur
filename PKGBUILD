# Maintainer: pan93412 <pan93412@gmail.com>

pkgname=ttf-bignoodletitling
pkgver=1
pkgrel=1

pkgdesc="Bignoodletitling, a font which uses on Overwatch."
arch=('any')
url="https://www.dafont.com/bignoodletitling.font"
license=('custom:Sentinel Type Freefont EULA')
depends=('fontconfig')
source=("bignoodletitling.zip::https://dl.dafont.com/dl/?f=bignoodletitling")
md5sums=('dc93df2d62cd2cb3277d53a98c46c755')

package() {
  cd $srcdir
  install -Dm644 Sentinel_Type_Freefont_EULA.txt "$pkgdir/usr/share/license/$pkgname/LICENSE"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
}
