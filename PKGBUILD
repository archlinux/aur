# Maintainer: erdii <me@erdii.engineering

pkgname=mage-bin
pkgver=1.15.0
pkgrel=2
pkgdesc="A Make/rake-like build tool using Go"
arch=("x86_64")
url="https://magefile.org"
license=("Apache")
provides=("mage")
conflicts=("mage")
source=("$pkgname-$pkgver.tar.gz::https://github.com/magefile/mage/releases/download/v${pkgver}/mage_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('af8fb0c72944ec6e31c5dd54e642083400157883602f4a89a692c4ba96ee1e66')

package() {
  install -Dm755 "${srcdir}/mage" "${pkgdir}/usr/bin/mage"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mage/LICENSE"
}
