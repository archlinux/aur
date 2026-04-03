pkgname=tux
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple TUI application launcher written in C"
arch=('x86_64')
url="https://github.com/JulB3y/tux"
license=('MIT')
depends=()
source=("https://github.com/JulB3y/tux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('63854c47eeb12d8327b0f998653e25673dd22b07eff9165901ad94f61f570908')

build() {
    cd "$srcdir/tux-$pkgver"
    make release
}

package() {
    cd "$srcdir/tux-$pkgver"
    install -Dm755 tux "$pkgdir/usr/bin/tux"
}
