# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.16.6
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('da4706778a170a064a9d76d2dfdae7dbc77c49df1ee589dff41c93ab96f875ee')
sha256sums_aarch64=('df406d093aa1dfc70092111c890f89c472f14233e82f1eab96fd77bb7336af0a')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
