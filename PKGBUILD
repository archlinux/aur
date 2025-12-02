# Maintainer: Alejandro Quintanar
pkgname=term39-bin
pkgver=0.16.4
pkgrel=1
pkgdesc="A modern terminal multiplexer with classic MS-DOS aesthetic, built with Rust. Full-screen interface with window management and complete terminal emulation. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/alejandroqh/term39"
license=('MIT')
provides=('term39')
conflicts=('term39')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-x86-binary.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alejandroqh/term39/releases/download/v$pkgver/term39-$pkgver-linux-64bit-arm-binary.tar.gz")
sha256sums_x86_64=('7f1fde70d2d142b16f7e289db4250a924b76145f89ba68095918e4c89af93a05')
sha256sums_aarch64=('56ecce066768aa7897a5f5127bc385d9ec41f482b76e17cc068a268316c1fb46')

package() {
    install -Dm755 term39 "$pkgdir/usr/bin/term39"
}
