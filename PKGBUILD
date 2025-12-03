# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.16.7
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('340e6bfc8a19c30d726d267b75699379a1cace748107e62a44870c483e73d298')
sha256sums_aarch64=('4025be4d701f3b2ffe612f1ca46d897682d17cc0b7a254a2bb36bb24df573f7b')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
