pkgname=pacmanfinder
pkgver=1.0
pkgrel=1
pkgdesc="Умный помощник для pacman с алгоритмом Левенштейна и поддержкой AUR"
arch=('x86_64')
url="https://github.com/timur/pacmanfinder"
license=('GPL')
depends=('pacman' 'yay' 'gcc')
source=("pacmanfinder.c")
sha256sums=('SKIP')

build() {
    cd "$srcdir"
    gcc pacmanfinder.c -o pacmanfinder
}

package() {
    cd "$srcdir"
    install -Dm755 pacmanfinder "$pkgdir/usr/bin/pacmanfinder"
}
