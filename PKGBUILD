# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('3cdf7c1de1773bfcd89d2cc7f8fc0ec1c01b8e05ccebfa62102df1a192cfbbda')
sha256sums_aarch64=('2242427999a1e6edcea683fbd7dde60dc0fdb95899c2fd717e8a4e9ed69e0acb')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
