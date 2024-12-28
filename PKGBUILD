# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Lucas Moidel <lucas122133@gmail.com>
pkgname=fjord-engine-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple 2d game engine based off of SDL2"
arch=(x86_64)
url="https://github.com/Lucasmoidel/Fjord.git"
license=('GPL')
makedepends=(git make sdl2 sdl2_ttf jsoncpp yaml-cpp box2d cmake)
provides=(Fjord-engine)
source=("git+$url")
sha256sums=('SKIP')

package() {
	cd Fjord
	pwd
	make install
}
