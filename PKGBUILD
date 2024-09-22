# Maintainer: Luna
pkgname=uwu-h
pkgver=1.3.0
pkgrel=1
pkgdesc="A basic AUR helper written in Rust."
arch=('x86_64')
url="https://github.com/Luca-Barra/uwu-h"
license=('MIT')
depends=('rust' 'cargo' 'lolcat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Luca-Barra/uwu-h/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/uwu-h" "$pkgdir/usr/bin/uwu-h"
}

