# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('c8e85fcb8a4799abeaceedbe431f26a60dd5bc1080aeac2e34bf29fc606e9eaa')
sha256sums_aarch64=('e8aee6127321e02d3d302324e3aa169d7c6847faf045b5829bcff683d9646817')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
