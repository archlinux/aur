# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=otf-fira-go
pkgver=1.001
pkgrel=3
_commit=715cd3e8b59179822cd5b86933ecfc254cd1e74e
pkgdesc="An independent Open Source typeface — FiraGO"
arch=('any')
conflicts=("ttf-fira-go")
url="https://github.com/bBoxType/FiraGO"
license=('OFL')
source=("$pkgname-$_commit.tar.gz::https://github.com/bBoxType/FiraGO/archive/$_commit.tar.gz")
sha256sums=('70baf5380062b7e4d185ae71b02e4efb5378878950d777f7fa9783e23afeffae')

package() {
  cd FiraGO-*/Fonts/FiraGO_OTF*

  install -Dt "$pkgdir"/usr/share/fonts/OTF -m644 */*.otf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../../OFL.txt
}
