# Maintainer: Kovács Bálint-Hunor <kovacsbalinthunor@protonmail.com>
pkgname=nodash-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="A modern terminal-based project launcher and manager for nvm node projects written in Rust"
arch=('x86_64')
url="https://github.com/MemerGamer/nodash"
license=('MIT')
depends=()
provides=('nodash')
conflicts=('nodash')
source=("https://github.com/MemerGamer/nodash/releases/download/v$pkgver/nodash-linux-v$pkgver")
sha256sums=('94387d39e0bdd9e96ab75ef9e5b03bf548bfae2ea01818044c5ab27aa750e294')

package() {
    install -Dm755 "nodash-linux-v$pkgver" "$pkgdir/usr/bin/nodash"
}
