# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('9ec3f171da08d8a5738578a53b3e6522c6f5d5753f1115c69a0e4b271b2dd8fc')
sha256sums_aarch64=('c9d723bab4a957fcb7ca6cf96d8da189850849a8b0868f8ca8310c8680c6c1b3')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
