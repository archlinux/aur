# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('c3ee110f5171f3ae6ad952555a8762d03f2480a65c95e971faae54dca916d849')
sha256sums_aarch64=('7cab79407a8566512f99fca218842eaf90e2e339fd8e560aa807458f1d75ba30')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
