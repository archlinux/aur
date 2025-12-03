# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.17.2
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('de47325cba98c25cc1d8220a02097b208052b6fbce60ed2d4f6987e22581254a')
sha256sums_aarch64=('b6fe3fd2eace8c7a14c420e37bdebd6bcd174739ce69624691c736b9b79252dd')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
