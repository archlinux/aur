pkgname=tag_game
pkgver=1.0
pkgrel=1
pkgdesc="A simple Tag game, written on C++ & SFML"
arch=( "any" )
url="https://github.com/KonstantinProgger/Tag-Puzzle"
license=( "Apache License 2.0" )
depends=( 'gcc' 'cmake' 'sfml' )
makedepends=( 'gcc' 'cmake' 'sfml' )
source=( "https://raw.githubusercontent.com/KonstantinProgger/my_archive/master/tag_puzzle.1.0.tar.gz" )
md5sums=( "141ea114226173625879a3dc9b3ebd1c" )

build() {
    cmake CMakeLists.txt
}

package() {
    sudo make install
}
