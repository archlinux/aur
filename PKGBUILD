# Maintainer: Kovács Bálint-Hunor <kovacsbalinthunor@protonmail.com>
pkgname=nodash-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A modern terminal-based project launcher and manager for nvm node projects written in Rust"
arch=('x86_64')
url="https://github.com/MemerGamer/nodash"
license=('MIT')
depends=()
provides=('nodash')
conflicts=('nodash')
source=("https://github.com/MemerGamer/nodash/releases/download/v$pkgver/nodash-linux-v$pkgver")
sha256sums=('c057312e9e1dfa7b0ca4781a9e574d0637a88b6815bfdb69691f4fd6c3ec2faf')

package() {
    install -Dm755 "nodash-linux-v$pkgver" "$pkgdir/usr/bin/nodash"
}
