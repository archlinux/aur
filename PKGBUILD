# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
pkgver=2.27.4
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(x86_64)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=8')
source=(https://github.com/broadinstitute/picard/releases/download/${pkgver}/picard.jar)
sha256sums=('1f9da276e5ee657907ee2fb5a86ab4e434cf80b1990f691ee944b99d3ce6bc38')

package() {
  install -Dm 755 picard.jar $pkgdir/usr/share/$pkgname/picard.jar
}
