# Maintainer: Ryan Gonzalez <rymg19 at gmail dot com>

pkgname=sourcekitten
pkgver=0.26.0
pkgrel=1
pkgdesc='An adorable little framework and command line tool for interacting with SourceKit.'
arch=('any')
url='https://github.com/jpsim/SourceKitten'
license=('MIT')
depends=('swift-language')
makedepends=('swift-language')
source=("https://github.com/jpsim/SourceKitten/archive/$pkgver.tar.gz")
sha256sums=('4c8ab67f15654a11da3739b966f5a0b379cf7a7626095238ad921d958c559c86')

prepare() {
  cd "SourceKitten-$pkgver"
}

package() {
  cd "SourceKitten-$pkgver"
  make install PREFIX="${pkgdir}/usr"
}
