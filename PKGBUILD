# Maintainer: Brandon Greenwell <greenwell.brandon@gmail.com>

pkgname=xleak-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="A fast terminal Excel viewer with interactive TUI, search, formulas, and export capabilities"
url="https://github.com/bgreenwell/xleak"
license=("MIT")
arch=("x86_64")
provides=("xleak")
conflicts=("xleak")
source=("https://github.com/bgreenwell/xleak/releases/download/v$pkgver/xleak-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("99144d1ddc6b28fe12264c1d74a2733e2f2d13185689361d85162eaa6cd5d6ae")

package() {
    install -Dm755 xleak -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
