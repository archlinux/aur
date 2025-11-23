# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('090de0b27cf06e4a436ea6e15a86afeb786d5ce671fb16908b82c2cb4940c6bb')
sha256sums_aarch64=('9110409c4fe5b2af677ce70997bfcaa1dba3063e927bed3e0f5a58b5b8c46a3c')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
