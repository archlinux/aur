# Maintainer: erdii <me@erdii.engineering

pkgname=mage-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="A Make/rake-like build tool using Go"
arch=("x86_64")
url="https://magefile.org"
license=("Apache")
provides=("mage")
conflicts=("mage")
source=("$pkgname-$pkgver.tar.gz::https://github.com/magefile/mage/releases/download/v${pkgver}/mage_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('1e21af64daf96f4b7211423ce11ef612f2f60add2a9eac60485f75c5d42a8c7f')

package() {
  install -Dm755 "${srcdir}/mage" "${pkgdir}/usr/bin/mage"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mage/LICENSE"
}
