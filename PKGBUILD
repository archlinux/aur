# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('a2b9df098db1484af318b424cfffe21a1bdd45558df988a9ee0c2ed0c0876aec')
sha256sums_aarch64=('ffbca021ff6136a65ee2051271ebcf49b639af198fc50b28d992c219e23ac868')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
