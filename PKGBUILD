# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('589f2fbc19f945feea05ca303afd6a207446c829bed75fae30929579ece1c450')
sha256sums_aarch64=('cfcfc33429d42b15ef9693a79916f25cf0d3cf6b02d68287c90234332a3d3b8f')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
