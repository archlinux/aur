# Maintainer: Paris Oplopoios <parisoplop@gmail.com>
pkgname="tkpemu"
pkgver="0.1.3"
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
	cd "TKPEmu"
	cd TKPEmu
	cmake -B build
	cmake --build build
	mkdir -p $pkgdir/usr/bin
	mv ./build/TKPEmu $pkgdir/usr/bin/TKPEmu
}


sha256sums=('64fea5a091d1974e03d6f650706397c0532eaa86125274d9bf373ce8c226ec88')
sha256sums=('64fea5a091d1974e03d6f650706397c0532eaa86125274d9bf373ce8c226ec88')
