# Maintainer: Guoyi
pkgname=freec
_pkgname=FREEC
pkgver=11.6
pkgrel=2
pkgdesc="Copy number and genotype annotation in whole genome and whole exome sequencing data"
arch=('x86_64')
url="https://github.com/BoevaLab/FREEC"
license=('GPL')
depends=()
makedepends=('make')
optdepends=()
source=(https://github.com/BoevaLab/FREEC/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('36564f86a01236e720cf412780e87eb24f224470f5bae45a99edb2d4a3cd1734')
build() {
  cd "${_pkgname}"-$pkgver
  cd src
  make
}

package() {
  cd "${_pkgname}"-$pkgver
  cd src
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname


}
