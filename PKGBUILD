pkgname=tux
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple TUI application launcher written in C"
arch=('x86_64')
url="https://github.com/JulB3y/tux"
license=('MIT')
depends=()
source=("https://github.com/JulB3y/tux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/tux-$pkgver"
    make release
}

package() {
    cd "$srcdir/tux-$pkgver"
    install -Dm755 tui-launcher "$pkgdir/usr/bin/tux"
}
