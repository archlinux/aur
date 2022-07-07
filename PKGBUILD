# Maintainer: GG weebcyberpunk@gmail.com
pkgname=tictactoe-git
pkgver=1.0.1
pkgrel=2
pkgdesc="The stupid terminal based tictactoe game"
arch=("x86_64")
url="https://www.github.com/weebcyberpunk/tictactoe"
license=('MIT')
provides=(tictactoe)
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "tictactoe"
    make
}

package() {
    cd "tictactoe"
    install -Dm755 tictactoe $pkgdir/usr/bin/tictactoe
    install -Dm644 "help.txt" $pkgdir/usr/share/tictactoe/"help.txt"
    install -Dm644 tictactoe.1 $pkgdir/usr/share/man/man1/tictactoe.1
}
