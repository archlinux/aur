# Maintainer: Abid H. Mujtaba <abid.naqvi83@gmail.com>
# Contributer: Jahanzaib (Urdu Jahan)
pkgname=ttf-jameel-noori-nastaleeq
pkgver=1
pkgrel=1
pkgdesc="Jameel Noori Nastaleeq Font for Urdu Typesetting"
arch=('any')
url='http://www.urdujahan.com/font.html'
license=('unknown')
source=('http://www.urdujahan.com/urdu-fonts/Jameel%20Noori%20Nastaleeq.zip')
md5sums=('5d9d00f0209a9a009beeac3be7db387c')


package() {
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 "$srcdir/Jameel Noori Nastaleeq/Jameel Noori Nastaleeq.ttf" "$pkgdir/usr/share/fonts/TTF/"
}
