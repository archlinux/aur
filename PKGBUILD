# Maintainer: Elim Garak <garak92@protonmail.com>
pkgname=rearx-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI client for the Searx meta-engine, written in Rust"
url="https://github.com/garak92/rearx"
license=("GPL v3.0")
arch=("x86_64")
provides=("rearx")
options=("strip")
source=("https://github.com/garak92/rearx/releases/download/v$pkgver/rearx-$pkgver-x86_64.tar.gz")
sha256sums=("c07d96264d4254c1a65464dbba78de58a90dc3ffb1ee38b8d798fe6558fd6f45")

package() {
    install -Dm755 rearx -t "$pkgdir/usr/bin/"
}
