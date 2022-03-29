# Maintainer: erdii <me@erdii.engineering

pkgname=mage-bin
pkgver=1.13.0
pkgrel=2
pkgdesc="A Make/rake-like build tool using Go"
arch=("x86_64")
url="https://magefile.org"
license=("Apache")
provides=("mage")
conflicts=("mage")
source=("$pkgname-$pkgver.tar.gz::https://github.com/magefile/mage/releases/download/v${pkgver}/mage_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('d9608a1b018ccf8929783e838a4e1f9d74b96ba0d317c814661d6d50e36a4a82')

package() {
  install -Dm755 "${srcdir}/mage" "${pkgdir}/usr/bin/mage"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mage/LICENSE"
}
