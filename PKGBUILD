pkgname=tux
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple TUI application launcher written in C"
arch=('x86_64')
url="https://github.com/JulB3y/tux"
license=('MIT')
depends=()
source=("https://github.com/JulB3y/tux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('046eafcc4763b5d82228be747c050dc17afe68e8e139969eccf44e0e4953a02a')

build() {
    cd "$srcdir/tux-$pkgver"
    make release
}

package() {
    cd "$srcdir/tux-$pkgver"
    install -Dm755 tux "$pkgdir/usr/bin/tux"
}
