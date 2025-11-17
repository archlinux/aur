# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('90012397d9e19ff11e926919cd97b2196e9c0d94540752d06e79ac182a7cec42')
sha256sums_aarch64=('7e4ce84d96e8a42f8902443c390d7f887c3651d9264fb7a919c2073e2527f7fb')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
