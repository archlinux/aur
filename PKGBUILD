# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
pkgver=2.27.2
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(x86_64)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=8')
source=(https://github.com/broadinstitute/picard/releases/download/${pkgver}/picard.jar)
sha256sums=('f7b623a93a56efd54f8d93220650ec31f9159c7ec20e431be834cfb221c61a2e')

package() {
  install -Dm 755 picard.jar $pkgdir/usr/share/$pkgname/picard.jar
}
