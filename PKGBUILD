# Maintainer: Alex Busch <abusch8@outlook.com>

pkgname=tetris-tui-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Modern Tetris TUI written in Rust'
arch=('x86_64')
url='https://github.com/abusch8/Tetris'
license=('GPL3')
depends=()
makedepend=('git' 'cargo')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make clean install
}

