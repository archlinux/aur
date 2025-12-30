# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('337d73908da5cac4873995f825a0f379eed7b8f39fc6e44985e55c1e22ad5583')
sha256sums_aarch64=('98cb147c53556e6d09f75b0d0d96c1026955c4468ed49acef59775b67ba1c610')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
