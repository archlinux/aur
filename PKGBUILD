# Maintainer: Elim Garak <garak92@protonmail.com>
pkgname=rearx-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A TUI client for the Searx meta-engine, written in Rust"
url="https://github.com/garak92/rearx"
license=("GPL v3.0")
arch=("x86_64")
provides=("rearx")
options=("strip")
source=("https://github.com/garak92/rearx/releases/download/v$pkgver/rearx-$pkgver-x86_64.tar.gz")
sha256sums=('b02887045ad7412e4a1a4fa35c978f83775ff3bd21a2009701f98374e4729d7f')

package() {
    install -Dm755 rearx -t "$pkgdir/usr/bin/"
}
