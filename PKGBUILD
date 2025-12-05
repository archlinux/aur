# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('4fa7eed95478db13d95e858998b51112d6bb4eddef37203ddad65c7a374ff5c7')
sha256sums_aarch64=('7550b95b6943ff173d5985e56f50485882da3e841516395b2bb3be7a509898fe')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
