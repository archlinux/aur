pkgname=cookie-git
pkgver=1.3
pkgrel=2
pkgdesc="Simple music player TUI"
arch=('x86_64')
url="https://github.com/FedGuy699/Cookie-Player"
license=('GPL')
depends=('ncurses' 'curl')
source=("git+https://github.com/FedGuy699/Cookie-Player.git")
sha256sums=('SKIP')

build() {
    g++ -s "$srcdir/Cookie-Player/music.cpp" -o cookie -lncurses -lcurl
}


package() {
    install -Dm755 cookie "$pkgdir/usr/bin/cookie"
}

