pkgname=tux
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple TUI application launcher written in C"
arch=('x86_64')
url="https://github.com/JulB3y/tux"
license=('MIT')
depends=()
source=("https://github.com/JulB3y/tux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72a4cfa8cbec19a90a5745bac60dc74e2c81ba6ea259be93e170d959ea268ab7')

build() {
    cd "$srcdir/tux-$pkgver"
    make release
}

package() {
    cd "$srcdir/tux-$pkgver"
    install -Dm755 tux "$pkgdir/usr/bin/tux"
}
