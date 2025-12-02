# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.16.5
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('f3b3fe5b7d96c3a790ca69ed8a43560ef1a7f1c2e09cb5280706e55c1998033d')
sha256sums_aarch64=('e55c6dc5888b566fb11e66ba1d1d77cacbe978bd479176f4f6823f9571059f36')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
