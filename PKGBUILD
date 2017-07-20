# Maintainer: Moritz Schaefer <mail AT moritzs DOT de>

pkgname=magma-ctglab
pkgver=1.06
pkgrel=1
pkgdesc="MAGMA is a tool for gene analysis and generalized gene-set analysis of GWAS data"
arch=('i686' 'x86_64')
url="https://ctg.cncr.nl/software/magma"
license=('GPL v3.0')
depends=('gcc')
source=("https://ctg.cncr.nl/software/MAGMA/prog/magma_v${pkgver}_source.zip")
md5sums=('71b5942d1b15c02bede23c4cd0312a6e')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/local/bin
  cp magma $pkgdir/usr/local/bin/magma-ctglab
}
