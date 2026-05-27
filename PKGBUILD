# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('6cb9f5f0ef78f1bdf4b1ad25972781aa0e82ad31539e1e3ebcf51c7cec33396c')
sha256sums_aarch64=('f279b2ff90c30e3f9e770033bc271198b4c80480dd79909527acf9f6a880dd2f')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
