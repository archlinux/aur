# Maintainer: Alex Busch <abusch8@outlook.com>

pkgname=tetris-tui-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Modern Tetris TUI written in Rust'
arch=('x86_64')
url='https://github.com/abusch8/Tetris'
license=('GPL3')
depends=()
makedepends=('git' 'cargo' 'rust')
source=('git+https://github.com/abusch8/Tetris')
sha256sums=('SKIP')

build() {
    cd "$srcdir/Tetris"
    make
}

package() {
    cd "$srcdir/Tetris"
    make clean install
}

