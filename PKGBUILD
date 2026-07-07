# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0-or-later')
provides=("herdr=${pkgver}")
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('043ef43ecbabda28465dcff1eec3184518150d567b8b8f20cda9c6c88770641d')
sha256sums_aarch64=('ea490094f2c7c39099870857d00c64c628ef7b5eba1967df4258033455ee2cb1')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
}
