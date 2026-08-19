# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/herdrdev/herdr"
license=('AGPL-3.0-or-later')
provides=("herdr=${pkgver}")
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/herdrdev/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/herdrdev/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('976150a14d490c94b243ea2e1a7eb2dfb67f12e36b182db90936f6728e6aecf4')
sha256sums_aarch64=('f55610658e1c2e0d2aaef730b4b2ab885f7f8ba00285ab372bfb14f2e3d5b40d')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
}
