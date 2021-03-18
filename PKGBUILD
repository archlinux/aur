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
sha256sums=("addb1ef77669d1dd1d31741f2999b87e29b72ed7e18e11f52a55cda5fcc06292")

backup=(etc/rearx/rearx.yaml)
package() {
    install -Dm755 rearx -t "$pkgdir/usr/bin/"
}
