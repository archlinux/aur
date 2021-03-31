pkgname=otf-xits
pkgver=1.302
pkgrel=2
pkgdesc="An OpenType implementation of STIX fonts with math support"
arch=('any')
url="https://github.com/alif-type/xits"
license=('custom:OFL')
ghname=xits
source=("https://github.com/alif-type/$ghname/archive/v$pkgver.tar.gz")
sha256sums=('a396dfddde7da50ce82cae530775ab522b1d33f87ca8211634535b6325a09c2b')

package() {
  cd "$srcdir/$ghname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
