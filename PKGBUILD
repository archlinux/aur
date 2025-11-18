# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('73385955a5d601f1c06b4e33da29d72727a57c10183b863029395d380531ab89')
sha256sums_aarch64=('6cc622e806e8cde29b094c0e21c06467cece5d29c8930a3c590c55334d0fa649')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
