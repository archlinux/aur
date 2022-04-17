# Maintainer: Guoyi
pkgname=freec
_pkgname=FREEC
pkgver=11.6
pkgrel=1
pkgdesc="Copy number and genotype annotation in whole genome and whole exome sequencing data"
arch=('x86_64')
url="https://github.com/BoevaLab/FREEC"
license=('GPL')
depends=()
makedepends=('make')
optdepends=()
source=(https://github.com/BoevaLab/FREEC/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('SKIP')
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
