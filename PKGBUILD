# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-fira-go
pkgver=1.001
pkgrel=2
_commit=715cd3e8b59179822cd5b86933ecfc254cd1e74e
pkgdesc="Independent Open Source typeface"
arch=('any')
url="https://bboxtype.com/typefaces/FiraGO/"
license=('custom:OFL')
source=("$pkgname-$_commit.tar.gz::https://github.com/bBoxType/FiraGO/archive/$_commit.tar.gz")
sha256sums=('70baf5380062b7e4d185ae71b02e4efb5378878950d777f7fa9783e23afeffae')

package() {
  cd FiraGO-*/Fonts/FiraGO_TTF*

  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 */*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../../OFL.txt
}
