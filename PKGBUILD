# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.4.11
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('a8170c5dc418f6074099f9f638ccfb14360083e751285efb6dc5b56304960e40')
sha256sums_aarch64=('becef7f2f23625dad59145f3ae041879cc5a98573e64fa784e9cfe497b23c5fd')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
