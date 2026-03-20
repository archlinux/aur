pkgname=tux
pkgver=0.1.7
pkgrel=1
pkgdesc="Simple TUI application launcher written in C"
arch=('x86_64')
url="https://github.com/JulB3y/tux"
license=('MIT')
depends=()
source=("https://github.com/JulB3y/tux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e275991ce1cfeefe0b2d207ffe5932048c6c213404bdc793b3fbf477f6b276c4')

build() {
    cd "$srcdir/tux-$pkgver"
    make release
}

package() {
    cd "$srcdir/tux-$pkgver"
    install -Dm755 tux "$pkgdir/usr/bin/tux"
}
