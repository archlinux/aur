# Maintainer: Ke Liu <spcter119@gmail.com>
# Contributor: Alexander Oleynichenko <alexvoleynichenko@gmail.com>

pkgname=bader
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="Quantum chemistry - Bader population analysis"
arch=('x86_64')
url="http://theory.cm.utexas.edu/henkelman/code/bader/"
license=('GPL')
groups=()
depends=(gcc-fortran)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://theory.cm.utexas.edu/henkelman/code/bader/download/bader.tar.gz')
noextract=()
md5sums=('ec66f494740b1cb9c59b506d4eaef9eb')
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname"
  make -f makefile.osx_gfortran
}

package() {
  install -D -m755 "$srcdir/$pkgname/bader" "$pkgdir/usr/bin/bader"
}