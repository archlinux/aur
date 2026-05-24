# Maintainer: Brandon Greenwell <greenwell.brandon@gmail.com>

pkgname=xleak-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="A fast terminal Excel viewer with interactive TUI, search, formulas, and export capabilities"
url="https://github.com/bgreenwell/xleak"
license=("MIT")
arch=("x86_64")
provides=("xleak")
conflicts=("xleak")
source=("https://github.com/bgreenwell/xleak/releases/download/v$pkgver/xleak-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("f3c7e4177dbec1639763c50b09ba41cf14ff7036f984d24db87658f4e7739437")

package() {
    cd "$srcdir/xleak-x86_64-unknown-linux-gnu"
    install -Dm755 xleak -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
