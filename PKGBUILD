# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('944bf4b0f25dd49309d00b8e5564f7246a3339c6d7d1e21cc13b8d4f0d050457')
sha256sums_aarch64=('0daec396992902c7b43a12a021a7814e1dd36fc5874c36da0ddc76c313f3ddb1')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
