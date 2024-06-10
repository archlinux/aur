# Maintainer: Shin-gema <Shin-gema@proton.me>
pkgname=tdl_terminal_directmedia_library
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="A graphical library that use the terminal as a display."
arch=('x86_64')
url="https://github.com/Shin-gema/TDL_Terminal-DirectMedia-Library"
license=('MIT')
groups=()
depends=('libpng' 'openal' 'freetype2' 'libsndfile')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Shin-gema/TDL_Terminal-DirectMedia-Library/archive/refs/tags/Release-${pkgver}.tar.gz")
noextract=()
sha256sums=('aadc33a715504a7db06e748632d44e86e6df654b182f5d1bcf7ec42506e9cfda')
validpgpkeys=()

build() {
	cd "$pkgname-Release-$pkgver"
	cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_DEMO=OFF -DBUILD_SHARED_LIBS=ON
	sudo cmake --build build --target install
}

package() {
	cd "$pkgname-Release-$pkgver"
}
