pkgname=quantum-espresso
pkgver=6.2
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
source=("http://qe-forge.org/gf/download/frsrelease/244/1114/qe-6.2.tar.gz")
noextract=()
md5sums=('016e7f22dba2086cc80c0f98447ddf1b')
validpgpkeys=()

build() {
	cd "$srcdir/qe-6.2"
	FFLAGS="-ffree-line-length-none" ./configure --prefix="$pkgdir/usr"
	make all
}

package() {
	cd "$srcdir/qe-6.2"
	make install
}
