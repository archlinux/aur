# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.14.5
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('28259b90d19e353584f6e6d4818b163ff7a08abc63e293addad9b728391aeef6')
sha256sums_aarch64=('7305a4ce0255b3a1f6d97932d8a512ed2ed632fcbbbf3f1f2b2921dbf034efa8')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
