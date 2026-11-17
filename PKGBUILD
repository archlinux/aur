# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jeremy Petch <jeremy.petch@outlook.com> 
pkgname=libgbm
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="libgbm is the Generic Buffer Management backend loader, which various packages and GBM vendors use."
arch=('x86_64')
url="https://github.com/glfs-book/libgbm"
license=('MIT')
groups=()
depends=()
makedepends=('meson')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/glfs-book/libgbm/archive/refs/tags/1.1.0.zip")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	meson setup build
	meson compile -C build
}

package() {
	cd "$pkgname-$pkgver/build"
	meson install
}
