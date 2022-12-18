# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>

pkgname=tag_puzzle
pkgver=1.0
pkgrel=2
pkgdesc="A simple Tag game, written on C++ & SFML"
arch=( "any" )
url="https://github.com/KonstantinProgger/Tag-Puzzle"
license=( "Apache License 2.0" )
makedepends=( 'cmake' 'sfml' )
source=( "https://github.com/KonstantIMP/Tag-Puzzle/archive/refs/tags/${pkgver}.tar.gz") 
sha256sums=('1c837a1e39ff50c43908cfb0cd100e2d1358218eca23f725ef1059be96610d47')

build() {
		cd Tag-Puzzle-1.0
    cmake CMakeLists.txt
    make all
}

package() {
	cd Tag-Puzzle-1.0
	make DESTDIR="${pkgdir}/" install
}
