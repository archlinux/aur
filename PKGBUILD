# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('0188a5c75d9b65bc9bb8d00a9dd9a943c09d5917c8c9d2474283ae9a495b6d23')
sha256sums_aarch64=('cc71b0e81bdd7c24ef86405793e1c6b4efcf45babad0809b552eb86ff7659f54')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
