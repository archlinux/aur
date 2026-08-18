# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A deterministic cross-platform task runner"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
provides=('only')
conflicts=('only-git')
source_x86_64=("only-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/only-linux-amd64")
source_aarch64=("only-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/only-linux-arm64")
sha256sums_x86_64=('71d2e0414870943f724b780ac9ea2675bf710b2e6f9bd2dbf0c9741778b2fabb')
sha256sums_aarch64=('60dba773339af6428ce2b9917ab1d0cf9cf4d3b6072bd846919e7616f19403a9')

package() {
    install -Dm755 "${srcdir}/only-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/only"
}
