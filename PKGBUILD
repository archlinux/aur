# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('ce6c2b0ad99201c210c1572214ac2f97aa29873196c17204d13e75fb2cbba8c1')
sha256sums_aarch64=('632218bc788440415f037d1cfc319d4c1661885daf4e64feb40f7bb702665461')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
