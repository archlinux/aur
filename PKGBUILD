# Maintainer: Angelo Fallaria <ba.fallaria@gmail.com>

pkgname=treefetch-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A lightning-fast system fetch tool built with Rust."
arch=('x86_64')
url="https://github.com/angelofallars/treefetch"
license=('MIT')
source=("https://github.com/angelofallars/treefetch/releases/download/v$pkgver/treefetch")
noextract=()
md5sums=("SKIP")

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/treefetch" "${pkgdir}/usr/bin/treefetch"
}
