# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-lekton
pkgver=1.0
pkgrel=2
pkgdesc="Lekton font"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
url='http://www.fontsquirrel.com/fonts/lekton'
source=("http://www.fontsquirrel.com/fonts/download/lekton")
md5sums=('815898ca5ce291f6c101ad3a1d7a92bb')
install=$pkgname.install
license=('custom')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir"/*.ttf \
     "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/SIL Open Font License.txt" \
	  "$pkgdir/usr/share/licenses/$pkgname/SIL_Open_Font_License.txt"
}
