# Packager: Vicente Ferrari <iamvik@pm.me>

pkgname=ttf-cardinal
pkgver=1
pkgrel=1
pkgdesc="Cardinal Anglican font."
url="http://moorstation.org/typoasis/designers/steffmann/samples/c/cardinal.htm"
arch=(any)
license=(custom)
source=("$pkgname-$pkgver.zip::https://dl.dafont.com/dl/?f=cardinal")

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
}

md5sums=('0b48707368de7130f7ff465a4f4002d2')
