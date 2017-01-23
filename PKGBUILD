# Contributor: Alexander Oleynichenko <alexvoleynichenko@gmail.com>
pkgname=bader
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Quantum chemistry - Bader population analysis"
arch=('x86_64')
url="http://theory.cm.utexas.edu/henkelman/code/bader/"
license=('GPL')
groups=()
depends=()
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
md5sums=('543c7bfa654ac4bcd69adc76da065cdf')
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname"
	make -f makefile.osx_gfortran
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/bader" "$pkgdir/usr/bin"
}
