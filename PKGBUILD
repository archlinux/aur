pkgname=quantum-espresso
pkgver=6.1
pkgrel=1
epoch=
pkgdesc="Computer codes for electronic-structure calculations and materials modeling
at the nanoscale. It is based on density-functional theory, plane waves, and
pseudopotentials."
arch=("x86_64")
url="http://www.quantum-espresso.org"
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
source=("http://qe-forge.org/gf/download/frsrelease/240/1075/qe-6.1.tar.gz")
noextract=()
md5sums=('db398edcad76e085f8c8a3f6ecb7aaab')
validpgpkeys=()

build() {
	cd "$srcdir/qe-6.1"
	FFLAGS="-ffree-line-length-none" ./configure --prefix="$pkgdir/usr"
	make all
}

package() {
	cd "$srcdir/qe-6.1"
	make install
}
