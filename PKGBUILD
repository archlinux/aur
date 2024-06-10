# Maintainer: Shin-gema <Shin-gema@proton.me>
pkgname=tdl_terminal_directmedia_library
pkgver=1.0.1
pkgrel=1
pkgdesc="A graphical library that use the terminal as a display."
arch=('x86_64')
url="github.com/Shin-gema/TDL_Terminal-DirectMedia-Library"
license=('MIT')
depends=('libpng' 'openal' 'freetype2' 'libsndfile')
_tag=f2ca047e0c7970050339c14a8622bb3e894e5d26
source=(https://github.com/Shin-gema/TDL_Terminal-DirectMedia-Library/archive/refs/tags/Release-1.0.1.tar.gz)
sha256sums=('71e4fec38de33b6979f7bdee37cf2af13ba9b27fdadf769c674c968a01eb228a')
	
build() {
	cd "TDL_Terminal-DirectMedia-Library-Release-1.0.1"
	cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_DEMO=OFF -DBUILD_SHARED_LIBS=ON
	sudo cmake --build build --target install
}

package() {
	cd "TDL_Terminal-DirectMedia-Library-Release-1.0.1"
}
