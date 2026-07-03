# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('64c2829b10d1187acd1530715120ef4bc5b94bd95c04593e0fc853e31e3f2829')
sha256sums_aarch64=('7bb3994fdd1e398ce07054a68f3e5399163cc86c9934060118aaa329b024a014')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
