# Maintainer: Spiros Georgaras <sng@hellug.gr>
pkgname=otf-quivira-font
pkgver=4.1
pkgrel=0
pkgdesc="Quivira is a mutli-script OTF font

It supports:
  Latin (Extended-D, Extended-E)
  Greek (modern and ancient)
  Ancient Greek Numbers
  Ancient Symbols
  Old Italic
  Cyrillic (Supplement and Extended-B)
  And others...
"
arch=('any')
license=('custom')
url="http://www.quivira-font.com/index.php"
depends=('fontconfig' 'xorg-font-utils')
source=('http://members.hellug.gr/sng/AUR/quivira-4.1.tar.gz')
md5sums=('50022081a09a7e5564212f2ba6a33b52')
install=${pkgname}.install

package() {
install -d ${pkgdir}/usr/share/fonts/OTF
install -Dm644 ${srcdir}/*/*.otf ${pkgdir}/usr/share/fonts/OTF/
install -d ${pkgdir}/usr/share/licenses/otf-quivira-font
install -Dm644 ${srcdir}/*/license ${pkgdir}/usr/share/licenses/otf-quivira-font/license
}
