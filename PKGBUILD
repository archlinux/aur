# Maintainer: xerneas3318 <184197860+xerneas3318@users.noreply.github.com>

pkgname=hackfetch-bin
pkgver=1.7.3
pkgrel=1
pkgdesc="Hack Club themed system fetch with live Hackatime stats"
arch=('x86_64' 'aarch64')
url="https://github.com/xerneas3318/hackfetch"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
provides=('hackfetch')
conflicts=('hackfetch')
options=('!strip')

source_x86_64=("hackfetch-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/hackfetch-linux-amd64.tar.gz")
source_aarch64=("hackfetch-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/hackfetch-linux-arm64.tar.gz")
sha256sums_x86_64=('fd6307cfb435aad7f7b68f463af9537f3e22aa8ea6367d24f5ba43ac0fdac712')
sha256sums_aarch64=('0396c1ad186fe155562e93a10439d88c733d1cf2872ece2328f4accc418b2e39')

package() {
    install -Dm755 "${srcdir}/hackfetch" "${pkgdir}/usr/bin/hackfetch"
}
