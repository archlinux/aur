# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('099c269c8b3b77e4e0af39f0a4fa847b4dbc86d0c58ecf63dbc569ee7025be31')
sha256sums_aarch64=('89d01c2f7508cbc454a119bceae735371fdf6d663b02c212df0b8b00d75185a9')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
