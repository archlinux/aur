# Maintainer: Nick Lanham <nickl@berkeley.edu>

pkgbase=meteocons
pkgname=(ttf-meteocons otf-meteocons)
pkgver=1.0
pkgrel=1
pkgdesc="A set of over 40 weather icons"
url="http://www.alessioatzeni.com/meteocons/"
license=('custom')
arch=('any')
depends=('fontconfig')
source=("http://www.alessioatzeni.com/meteocons/res/download/meteocons-font.zip"
	      "License.txt")
sha256sums=('a9550332979f36a572ee0693ab1c07e44e47d5ac72c424f6db1e81cca2a1c74b'
            '7aa921e93c2849ddb4e1a383063bf23c81a9f1dd1aebd3674caceb061b51d104')

package_ttf-meteocons() {
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"
  cd "meteocons-font/FONT/Desktop-font"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

package_otf-meteocons() {
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"
  cd "meteocons-font/FONT/Desktop-font"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
}
