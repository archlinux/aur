# Maintainer: VanHoney <dev@vanhoney.net>
pkgname=rusticize-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="NEMESIS ENGINE Rust Learning Platform — built-in playground, progressive lessons, dark theme"
arch=('x86_64')
url="https://github.com/VanHoney-ltd/rusticize"
license=('MIT')
provides=('rusticize')
conflicts=('rusticize')
source=("$url/releases/download/v$pkgver/rusticize")
sha256sums=('3ed7fd1ae940f79ba3c12c1c305e0c1c2d5b89e16198cc30b451588f4172308b')

package() {
    install -Dm755 rusticize "$pkgdir/usr/bin/rusticize"
}
