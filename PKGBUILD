# Maintainer: xerneas3318 <184197860+xerneas3318@users.noreply.github.com>

pkgname=hackfetch-bin
pkgver=2.1.0
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
sha256sums_x86_64=('7e40f64b60938a36c4faa91953d9c68e418c879141574008ac03437450f09110')
sha256sums_aarch64=('ac7ab69a3a6ad6144e0cf8209483190a6e8c10e44b9f3a17c7c02e57f40e54a6')

package() {
    install -Dm755 "${srcdir}/hackfetch" "${pkgdir}/usr/bin/hackfetch"
}
