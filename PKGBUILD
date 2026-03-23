# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('02da1979cf4dff3ef4805b101cde9d7dc0780e3f3d248e72c05d68a07541d109')
sha256sums_aarch64=('e8583551d6185a7045aafec15bf9416ba5738e7ac850a179541d23092a5363da')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
