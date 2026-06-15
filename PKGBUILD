# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0-or-later')
provides=("herdr=${pkgver}")
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('ad2a5d480a4e04609a9dd30a19ec07854578df6b5f0ea9299246963baf40363b')
sha256sums_aarch64=('77407959c514c25c870bbcc6d2a2c86fef5b5701ed0c7c37745d7412e8563d72')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
}
