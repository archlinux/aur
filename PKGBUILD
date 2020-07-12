# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-lekton
pkgver=1.0
pkgrel=6
pkgdesc="Lekton font"
arch=('any')
url='http://www.fontsquirrel.com/fonts/lekton'
source=("$pkgname-$pkgver.zip::http://www.fontsquirrel.com/fonts/download/lekton")
sha256sums=('SKIP') # hashsums differ every now and then
license=('custom')

package() {
  install -d "$pkgdir"/usr/share/fonts/TTF
  cp -dpr --no-preserve=ownership "$srcdir"/*.ttf \
     "$pkgdir"/usr/share/fonts/TTF/
  install -Dm644 "$srcdir"/"SIL Open Font License.txt" \
	  "$pkgdir"/usr/share/licenses/$pkgname/SIL_Open_Font_License.txt
}

