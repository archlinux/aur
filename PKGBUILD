# Maintainer: erdii <me@erdii.engineering

pkgname=mage-bin
pkgver=1.12.1
pkgrel=2
pkgdesc="A Make/rake-like build tool using Go"
arch=("x86_64")
url="https://magefile.org"
license=("Apache")
provides=("mage")
conflicts=("mage")
source=("$pkgname-$pkgver.tar.gz::https://github.com/magefile/mage/releases/download/v${pkgver}/mage_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('bed46f9f509fd515382a9113c683841f029e86a8f2357380bfe80b75768ff099')

package() {
  install -Dm755 "${srcdir}/mage" "${pkgdir}/usr/bin/mage"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mage/LICENSE"
}
