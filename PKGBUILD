# Maintainer: Peter Majchrak <petoknm@gmail.com>

pkgname=rxcpp-git
pkgver=4.0.0
pkgrel=1
pkgdesc="Reactive Extensions for C++"
arch=('x86_64')
url="https://github.com/Reactive-Extensions/RxCpp"
license=('Apache')
groups=()
depends=()
makedepends=('gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Reactive-Extensions/RxCpp.git#tag=v4.0.0")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "RxCpp/projects/CMake"
	cmake .
}

package() {
	cd "RxCpp/projects/CMake"
	make DESTDIR="$pkgdir/" install
}
