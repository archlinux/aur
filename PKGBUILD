# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0-or-later')
provides=("herdr=${pkgver}")
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('3dc83288073e4c2d3c679a30e7be97bcca9141c6fd17dbbb9219142e95c59253')
sha256sums_aarch64=('32e763a1499a6b694b1d708e4f062b743be1da9f34fcfa4d212d6db6fe09a8b9')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
}
