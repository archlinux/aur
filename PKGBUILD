# Maintainer: Ke Liu <spcter119@gmail.com>
# Contributor: Alexander Oleynichenko <alexvoleynichenko@gmail.com>

pkgname=bader
pkgver=1.0.5
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
sha256sums=('8dcc32a17b8caf11622347ed89924edb6cebbee63bfd7bf30e752f0fb402aa25')
noextract=()
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname"
  make -f makefile.lnx_ifort FC="gfortran" FFLAGS="$FFLAGS" LINK=""
}

package() {
  install -D -m755 "$srcdir/$pkgname/bader" "$pkgdir/usr/bin/bader"
}

