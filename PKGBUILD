# Maintainer:  Agatha Zeren <agatha@zeren.com>

pkgname=otf-clara
pkgver=1
pkgrel=1
pkgdesc='A a serif font family created specially for printing A Dictionary of Editing (2015)'
arch=('any')
url='https://fontesk.com/clara-typeface/'
license=('custom:SIL Open Font License v1.1')
source=("${pkgname}-${pkgver}.zip::https://fontesk.com/download/33540/")
sha256sums=('67c0e3208aa3418a37aef69446ca0ca4de29d9a985d6cdeca1d55a88c2d55001')

package() {
  cd $srcdir
  echo opentype/*.otf
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" opentype/*.otf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "doc/COPYING"
}
