# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('01822b4d79323d966b2bd3307bfff61d13edde6fafc6dcdf9f2a82fa05d8c445')
sha256sums_aarch64=('3226cc5df618111c7945fa4db6e8d68e4fa57f88abad9e5ccd148a3098db5774')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
