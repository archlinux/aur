# Maintainer: Elim Garak <garak92@protonmail.com>
pkgname=rearx
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI client for the Searx meta-engine, written in Rust"
url="https://github.com/garak92/rearx"
license=("GPL v3.0")
arch=("x86_64")
provides=("rearx")
options=("strip")
source=("https://github.com/garak92/rearx/releases/download/v$pkgver/rearx-$pkgver-x86_64.tar.gz")
sha256sums=("fd21d8f845a5abc7a445574f5ea97313c92a9a5b65808fde4081fb05524a2b4c")

package() {
    install -Dm755 rearx -t "$pkgdir/usr/bin/"
    #Create rearx config directory and config file
    mkdir -p ~/.config/rearx/
    echo ""https://searx.garudalinux.org/"" > ~/.config/rearx/rearx.yaml
}
