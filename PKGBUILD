# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-alegreya
pkgver=1.003
pkgrel=3
pkgdesc="Alegreya fonts"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
url='http://www.fontsquirrel.com/fonts/alegreya'
source=("http://www.fontsquirrel.com/fonts/download/alegreya")
md5sums=('SKIP')
conflicts=('otf-google-fonts-hg')
install=$pkgname.install
license=('custom')

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  cp -dpr --no-preserve=ownership "$srcdir"/*.otf \
     "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "$srcdir/SIL Open Font License.txt" \
	  "$pkgdir/usr/share/licenses/$pkgname/SIL_Open_Font_License.txt"
}
