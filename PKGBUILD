pkgname=simple_snake
pkgver=1.0
pkgrel=1
pkgdesc="A simple Snake game, written on C++ & SFML"
arch=( "any" )
url="https://github.com/KonstantinProgger/Tag-Puzzle"
license=( "Apache License 2.0" )
depends=( 'gcc' 'cmake' 'sfml' )
makedepends=( 'gcc' 'cmake' 'sfml' )
source=( "https://raw.githubusercontent.com/KonstantinProgger/my_archive/master/snake/linux/snake.1.0.tar.gz" )
md5sums=( "d200fa770ff0475bdffd205aadb43d8a" )

package() {
    cmake CMakeLists.txt
    make all
    sudo make install
}
