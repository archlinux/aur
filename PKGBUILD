# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-lekton
pkgver=1.0
pkgrel=4
pkgdesc="Lekton font"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
url='http://www.fontsquirrel.com/fonts/lekton'
source=("$pkgname-$pkgver.zip::http://www.fontsquirrel.com/fonts/download/lekton")
md5sums=('bf04790dd611759ba8f8f540f3fafe1d')
install=$pkgname.install
license=('custom')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir"/*.ttf \
     "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/SIL Open Font License.txt" \
	  "$pkgdir/usr/share/licenses/$pkgname/SIL_Open_Font_License.txt"
}

