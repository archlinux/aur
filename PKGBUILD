pkgname=cookie-git
pkgver=1.0.r0
pkgrel=1
pkgdesc="Simple music player TUI"
arch=('x86_64')
url="https://github.com/FedGuy699/Cookie-Player"
license=('GPL')
depends=('ncurses')
source=("git+https://github.com/FedGuy699/Cookie-Player.git")
sha256sums=('SKIP')

build() {
    g++ -s "$srcdir/Cookie-Player/music.cpp" -o cookie -lncurses
}


package() {
    install -Dm755 cookie "$pkgdir/usr/bin/cookie"
}

