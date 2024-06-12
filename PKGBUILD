# Maintainer: Shin-gema <Shin-gema@proton.me>
pkgname=tdl_terminal_directmedia_library
pkgver=1.0.2
pkgrel=1
pkgdesc="A graphical library that use the terminal as a display."
arch=('x86_64')
url="github.com/Shin-gema/TDL_Terminal-DirectMedia-Library"
license=('MIT')
depends=('libpng' 'openal' 'freetype2' 'libsndfile')
source=(https://github.com/Shin-gema/TDL_Terminal-DirectMedia-Library/archive/refs/tags/Release-1.0.2.tar.gz)
sha256sums=('SKIP')
	
build() {
	cd "TDL_Terminal-DirectMedia-Library-Release-1.0.2"
	cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_DEMO=OFF -DBUILD_SHARED_LIBS=ON
	sudo cmake --build build --target install
}

package() {
	cd "TDL_Terminal-DirectMedia-Library-Release-1.0.2"
}
