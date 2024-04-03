#Maintainer: VPeti1 (Vasko Peter) 

pkgname=easypacman
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="An APT like implementation of pacman"

depends=('gcc')

source=("https://github.com/VPeti1/CWAcces/raw/main/easypacman.tar.gz")

sha256sums=('0f91b8e93e7b9b0421562384c08cee0a285ec8d8b8f17e9fe56b97b45a6cec12')

build() {
    cd "$srcdir"
    g++ -o easypacman main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 easypacman "$pkgdir/usr/bin/easypacman"
}


