# Maintainer: Paris Oplopoios <parisoplop@gmail.com>
pkgname="tkpemu"
pkgver="0.1.1"
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
source=("https://github.com/OFFTKP/TKPEmu/archive/v0.1.1/TKPEmu-0.1.1.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

package() {
	cd "TKPEmu-$pkgver"
	cd TKPEmu
	cmake -B build
	cmake --build build
	mkdir -p $pkgdir/usr/bin
	mv ./build/TKPEmu $pkgdir/usr/bin/TKPEmu
}
sha256sums=('90281b191539eff0c7df0010aa04ea07c18e288aa77b16e16f6a56fa332bb416')
