# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('0be658cb31aacbec7f3b033df8ae012767a822f0a71eac2f2b2fef91cbcf6053')
sha256sums_aarch64=('22c0c3c583057dced0b291e7b53e5d39a3417639f4bb6c3b8532b14738e181de')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
