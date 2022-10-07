# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
pkgver=2.27.5
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(x86_64)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=8')
source=(https://github.com/broadinstitute/picard/releases/download/${pkgver}/picard.jar)
sha256sums=('131ca3e0626a3ef12e8399795e7a49f829bb4e85d71b489bf4f231d21a6c3199')

package() {
  install -Dm 755 picard.jar $pkgdir/usr/share/$pkgname/picard.jar
}
