# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('33a8459d045187254c90189d46e49e630d00268f0f50e98e25010677af0767f8')
sha256sums_aarch64=('6f795ad28668b297566350aa8928e40dea6962a90e66ad37b26697338f5e09ac')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
