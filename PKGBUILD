# Maintainer: Pando85 <pando855@gmail.com>
pkgname=swaybeam-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Miracast source implementation for wlroots-based compositors written in Rust (binary)"
arch=('x86_64')
url="https://github.com/forkline/swaybeam"
license=('MIT')
provides=('swaybeam')
conflicts=('swaybeam')

source_x86_64=("swaybeam-${pkgver}-x86_64.tar.gz::https://github.com/forkline/swaybeam/releases/download/v${pkgver}/swaybeam-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('0237e828455daa1c3e2fd22c2110026ec3e29a3fe9bc03b98fcc510a8136c79f')

package() {
    tar -xzf swaybeam-${pkgver}-x86_64.tar.gz
    install -Dm755 "swaybeam" "${pkgdir}/usr/bin/swaybeam"
}
