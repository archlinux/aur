# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.19.5
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('25a70b6df36a5f4dba6d091a4057e8f74da4cb52fa2ad8065504a1355b19dff0')
sha256sums_aarch64=('7ef96825b5930ebf2020a817e4e9c39f2560c992a6bcf1bcfe80b8d098c99361')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
