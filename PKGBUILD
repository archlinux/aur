pkgname=quantum-espresso
pkgver=6.0beta
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
source=("http://qe-forge.org/gf/download/frsrelease/219/1003/espresso-6.0-beta.tar.gz")
noextract=()
md5sums=("862179fa410a198d6ff52068e0e30a1d")
validpgpkeys=()

build() {
	cd "$srcdir/espresso-6.0-beta"
	FFLAGS="-ffree-line-length-none" ./configure --prefix="$pkgdir/usr"
	make all
}

package() {
	cd "$srcdir/espresso-6.0-beta"
	make install
}
