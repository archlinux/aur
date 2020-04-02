pkgname=tag_puzzle
pkgver=1.1
pkgrel=1
pkgdesc="A simple Tag game, written on C++ & SFML"
arch=( "any" )
url="https://github.com/KonstantinProgger/Tag-Puzzle"
license=( "Apache License 2.0" )
depends=( 'gcc' 'cmake' 'sfml' )
makedepends=( 'gcc' 'cmake' 'sfml' )
source=( "https://raw.githubusercontent.com/KonstantinProgger/my_archive/master/tag_puzzle.1.0.tar.gz" )
md5sums=( "94e4af698007f41ee4dac5468e77811e" )

package() {
    cmake CMakeLists.txt
    make all
    sudo make install
}
