# Maintainer: Paris Oplopoios <parisoplop@gmail.com>
pkgname="tkpemu"
pkgver="0.1.2"
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
source=("https://github.com/OFFTKP/TKPEmu/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
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

sha256sums=('8350366451237e35edcae660dfc32554f9e5f9580221a8c8170348e8872b27d3')
