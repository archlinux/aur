pkgname=tag_puzzle
pkgver=1.2
pkgrel=1
pkgdesc="A simple Tag game, written on C++ & SFML"
arch=( "any" )
url="https://github.com/KonstantinProgger/Tag-Puzzle"
license=( "Apache License 2.0" )
depends=( 'gcc' 'cmake' 'sfml' )
makedepends=( 'gcc' 'cmake' 'sfml' )
source=( "https://raw.githubusercontent.com/KonstantinProgger/my_archive/master/tag_puzzle/linux/tag_puzzle.1.2.tar.gz" )
md5sums=( "0522504012e0b35716574d61718c953a" )

package() {
    cmake CMakeLists.txt
    make all
    sudo make install
}
