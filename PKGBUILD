# Maintainer: Paris Oplopoios <parisoplop@gmail.com>
pkgname="tkpemu"
pkgver="0.1.4"
pkgrel=1
epoch=
pkgdesc="A multi-purpose emulator with debugging functionality, currently only emulates gameboy"
arch=('any')
url="https://github.com/OFFTKP/TKPEmu.git"
license=('MIT')
groups=()
depends=("cmake" "sdl2" "boost>=1.76" "tbb" "gcc")
makedepends=(cmake sdl2 boost tbb)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/OFFTKP/TKPEmu/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

package() {
	cd TKPEmu
	cd TKPEmu
	cmake -B build
	cmake --build build
	mkdir -p $pkgdir/usr/bin
	mv ./build/TKPEmu $pkgdir/usr/bin/TKPEmu
}


sha256sums=('6aef534a5a06e3e824802b8db8845f8fa87691762278607a03033bd60b6475c4')
sha256sums=('49c76169a65edb9c2d6469279cf9ead6118bce654df93eba08bacf6483cc1e3b')
