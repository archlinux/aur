# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Miloserdev <https://github.com/miloserdev>
pkgname=xec
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="embedded controller i/o"
arch=(x86_64 i686)
url="https://github.com/miloserdev/xec.git"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd xec
	cat xec.cpp
}

build() {
	cd xec
	g++ xec.cpp -o xec
}

check() {
	cd xec
}

package() {
	cd xec
	mkdir -p "${pkgdir}/usr/bin"
	cp xec "${pkgdir}/usr/bin/xec"
	chmod +x "${pkgdir}/usr/bin/xec"
}
