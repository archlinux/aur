# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('7a97868f4b1cdcff2f8aa58afb0cf9091adbb47ccef2325fb72da487acb5e38b')
sha256sums_aarch64=('0e5ac08f37259e2e46262952ba9c2195689ffac977e8e71323edfd134da94534')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
