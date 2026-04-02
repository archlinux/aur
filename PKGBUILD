# Maintainer: Pando85 <pando855@gmail.com>
pkgname=swaybeam-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Miracast source implementation for wlroots-based compositors written in Rust (binary)"
arch=('x86_64')
url="https://github.com/forkline/swaybeam"
license=('MIT')
provides=('swaybeam')
conflicts=('swaybeam')

source_x86_64=("swaybeam-${pkgver}-x86_64.tar.gz::https://github.com/forkline/swaybeam/releases/download/v${pkgver}/swaybeam-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('24ddccbc616240087eb32dbaa5dd6d4175f653f45327f31fc5c86eb52ddbfc7a')

package() {
    tar -xzf swaybeam-${pkgver}-x86_64.tar.gz
    install -Dm755 "swaybeam" "${pkgdir}/usr/bin/swaybeam"
}
