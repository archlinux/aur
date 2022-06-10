# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
pkgver=2.27.3
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(x86_64)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=8')
source=(https://github.com/broadinstitute/picard/releases/download/${pkgver}/picard.jar)
sha256sums=('4b375ca3d1a82fbe0206fc9b363e7082a4fa14aff689f5e0e3311de5006a16c8')

package() {
  install -Dm 755 picard.jar $pkgdir/usr/share/$pkgname/picard.jar
}
