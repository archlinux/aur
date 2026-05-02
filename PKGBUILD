# Maintainer: Pando85 <pando855@gmail.com>
pkgname=swaybeam-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Miracast source implementation for wlroots-based compositors written in Rust (binary)"
arch=('x86_64')
url="https://github.com/forkline/swaybeam"
license=('MIT')
provides=('swaybeam')
conflicts=('swaybeam')

source_x86_64=("swaybeam-${pkgver}-x86_64.tar.gz::https://github.com/forkline/swaybeam/releases/download/v${pkgver}/swaybeam-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('0ee1a2a0d9ba7a94fa4a7478f13f74d19d0b001981c546b41478ea2839c83da0')

package() {
    tar -xzf swaybeam-${pkgver}-x86_64.tar.gz
    install -Dm755 "swaybeam" "${pkgdir}/usr/bin/swaybeam"
}
