pkgname=tux
pkgver=0.1.5
pkgrel=1
pkgdesc="Simple TUI application launcher written in C"
arch=('x86_64')
url="https://github.com/JulB3y/tux"
license=('MIT')
depends=()
source=("https://github.com/JulB3y/tux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d1dc958dc833ed47b6c004ee9574564e16fd0f3905a220fa316f41094ac52e6d')

build() {
    cd "$srcdir/tux-$pkgver"
    make release
}

package() {
    cd "$srcdir/tux-$pkgver"
    install -Dm755 tux "$pkgdir/usr/bin/tux"
}
