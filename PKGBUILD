# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0-or-later')
provides=("herdr=${pkgver}")
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('bc0fc02d4ba500f9cac2353a43e67fe036785ecca6eb55378e050fac3c103059')
sha256sums_aarch64=('544e0002de42806d1ab64ccdef3a7e7414f24717b0b6b022bc9e57d2eefd26a2')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
}
