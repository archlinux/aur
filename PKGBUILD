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
sha256sums=('8cb2fc8d326c40f094db393ed5308566e85187fd29cf6027cabaa7e50c796901')

backup=(etc/rearx/rearx.yaml)
package() {
    install -Dm755 rearx -t "$pkgdir/usr/bin/"
}
