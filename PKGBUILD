# Maintainer: Abid H. Mujtaba <abid.naqvi83@gmail.com>
# Contributer: Jahanzaib (Urdu Jahan)
pkgname=ttf-jameel-noori-nastaleeq
pkgver=1.1.0
pkgrel=1
pkgdesc="Jameel Noori Nastaleeq Font for Urdu Typesetting"
arch=('any')
url='http://www.urdujahan.com/font.html'
license=('unknown')
source=('https://github.com/abid-mujtaba/ttf-jameel-noori-nastaleeq/archive/refs/tags/v1.1.0.tar.gz')
md5sums=('b45b88700e74483115d1f12ff69e0688')


package() {
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 "$srcdir/ttf-jameel-noori-nastaleeq-1.1.0/Jameel Noori Nastaleeq.ttf" "$pkgdir/usr/share/fonts/TTF/"
}
