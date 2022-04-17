# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
pkgver=2.27.1
pkgrel=2
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(x86_64)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=8')
source=(https://github.com/broadinstitute/picard/releases/download/${pkgver}/picard.jar)
sha256sums=('87e94cebeeeaaa19dd2a5ab2d76b9ac51b007fbe5926294f9bb83b6811513152')

package() {
  install -Dm 755 picard.jar $pkgdir/usr/share/$pkgname/picard.jar
}
