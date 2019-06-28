# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='railway-sans-font'
pkgver='20170421'
pkgrel='5'
pkgdesc="An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916"
arch=('any')
url='https://fontlibrary.org/en/font/railway-sans'
license=('custom:SIL Open Font License v1.1')
source=('https://fontlibrary.org/assets/downloads/railway-sans/9f707f44ac7fca4fb8371e69b19df471/railway-sans.zip')
sha256sums=('b47c3a14813fed0898b9d7ec9300b58ee0f91155fcdaa1dca4e78647d4ee92a0')

package() {
	install -dm755 "$pkgdir/usr/share/fonts/"{O,T}'TF'
	install -m644 "$srcdir/OTF/"*'.otf' "$pkgdir/usr/share/fonts/OTF/"
	install -m644 "$srcdir/TTF/"*'.ttf' "$pkgdir/usr/share/fonts/TTF/"
}
