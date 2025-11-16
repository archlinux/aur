# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('74e7da4c1ba5478e923957e8bdfef7c5650b8428826ccc9e343d6505abed5d37')
sha256sums_aarch64=('9441746ac70c98fbaba6284fb02844ac483856a4f73c1200b4a50c1d3909035e')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
