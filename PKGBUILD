# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('22f9124f9a7fbdac1cdfd849ef98ebc4dc84ff1af69aec32545fd50bc3cd566f')
sha256sums_aarch64=('3fbcbac3f71920474134f7f77b44f10626e24b963d7c0174d3f7a5839c740edd')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
