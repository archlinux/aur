# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('aab5a1edf667a846151395cd291802c654440a83500c3c16cb61521ea801c932')
sha256sums_aarch64=('9ee49b2f6a1136101d69e55460e111b06fe96292d8a7c150179ffde598f771ee')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
