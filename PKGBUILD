# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.15.3
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('3fce6ec6c2facd19ed578bbf5d0bb9864a9b005362724d720592141dfa5340de')
sha256sums_aarch64=('2044fca6f734196e7a01f5e61582912181ea2f5c29d16394c7e8c14e4c41c2a8')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
