# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('70ef4ce425c0697901a26b6c07562faf0d7f54d8c6b6df542a95a9774760e2bf')
sha256sums_aarch64=('78d5e27b335ae656218f2a23d355e9ccab0db32dcd85bec91945eb9acd7d8669')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
