# Maintainer: Abid H. Mujtaba <abid.naqvi83@gmail.com>
# Contributer: Abdullah <abdullah at abdullah dot today>
pkgname=ttf-jameel-noori-nastaleeq
pkgver=2
pkgrel=2
pkgdesc="Jameel Noori Nastaleeq Font for Urdu Typesetting"
arch=('any')
url='http://www.urdufont.org'
license=('MIT')
source=('https://www.urdufont.org/download/Jameel%20Noori%20Nastaleeq.zip')
md5sums=('df107283a6bfcf2efb8a051d204cc778')


package() {
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 "$srcdir/Jameel Noori Nastaleeq.ttf" "$pkgdir/usr/share/fonts/TTF/"
}
