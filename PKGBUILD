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
sha256sums=('dd7d906fa0148347923fd88fe6f25b6e44713ecda2b8ca7fc98e457083b40278')

backup=("etc/$pkgname/rearx.yaml")
package() {
    install -Dm755 rearx -t "$pkgdir/usr/bin/"
}
