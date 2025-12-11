# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('cad0018dd4ba5c346dbd9c69640b9a9fa0603d3854f2446e2d072d9532f44802')
sha256sums_aarch64=('f3d7d5a98c7a90d4abd5ef34c1079dfda74c28955593d74c117d5a4573cf47aa')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
