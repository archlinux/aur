# Maintainer: erdii <me@erdii.engineering

pkgname=mage-bin
pkgver=1.17.1
pkgrel=0
pkgdesc="A Make/rake-like build tool using Go"
arch=("x86_64")
url="https://magefile.org"
license=("Apache")
provides=("mage")
conflicts=("mage")
source=("$pkgname-$pkgver.tar.gz::https://github.com/magefile/mage/releases/download/v${pkgver}/mage_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('6e03c7485d13559e9eec2027a057db9019fbbe569d620046b92f2a9bced0a949')

package() {
  install -Dm755 "${srcdir}/mage" "${pkgdir}/usr/bin/mage"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mage/LICENSE"
}
