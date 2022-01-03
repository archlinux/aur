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
	cd "TKPEmu-$pkgver"
	cd TKPEmu
	cmake -B build
	cmake --build build
	mkdir -p $pkgdir/usr/bin
	mv ./build/TKPEmu $pkgdir/usr/bin/TKPEmu
}


sha256sums=('c41dcece6e15a9c4548a08b87c342ad917515beefb29aad5e974eab9f1cc57b7')
sha256sums=('c41dcece6e15a9c4548a08b87c342ad917515beefb29aad5e974eab9f1cc57b7')
