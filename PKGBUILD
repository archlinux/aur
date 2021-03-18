# Maintainer: Elim Garak <garak92@protonmail.com>
pkgname=rearx-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A TUI client for the Searx meta-engine, written in Rust"
url="https://github.com/garak92/rearx"
license=("GPL v3.0")
arch=("x86_64")
provides=("rearx")
options=("strip")
source=("https://github.com/garak92/rearx/releases/download/v$pkgver/rearx-$pkgver-x86_64.tar.gz")
sha256sums=('1cfef1f6d385adf0cee0998e543cd097e63bb143fa41e4b44577c72a06b40659')

package() {
    install -Dm755 rearx -t "$pkgdir/usr/bin/"
}
