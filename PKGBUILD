# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>

pkgname=ttf-barcodes
pkgver=2.0.1
pkgrel=1
pkgdesc="Several barcode fonts: for EAN-13/8, 3 of 9, code 128, 2 of 5 interleaved, pdf417 and datamatrix"
arch=('any')
license=('GPL2')
url="http://grandzebu.net/informatique/codbar-en/codbar.htm"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(http://grandzebu.net/informatique/codbar/openbarcodes.zip)
sha256sums=('3b919ebf22f5f4f547c9e7251cdde74c44ff809db6238fa2a9fae79aee30b405')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 fonts/*.ttf "$pkgdir/usr/share/fonts/TTF"
}
