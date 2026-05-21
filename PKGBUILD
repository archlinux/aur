# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('283bc5fd423b304702f8d551fce4cbc55e3b556d0c9e6643ea3577abf49674a1')
sha256sums_aarch64=('bf1bd3c3d98bbfd9cd4fe864f5c7cf9a1089a4afc6be90720e09a055368d4495')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
