# Maintainer: Ke Liu <spcter119@gmail.com>
# Contributor: Alexander Oleynichenko <alexvoleynichenko@gmail.com>

pkgname=bader
pkgver=1.0.4
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
md5sums=('c736d9d3cb216951a57ca51e73e6280a')
noextract=()
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname"
  make -f makefile.lnx_ifort FC="gfortran" LINK=""
}

package() {
  install -D -m755 "$srcdir/$pkgname/bader" "$pkgdir/usr/bin/bader"
}
