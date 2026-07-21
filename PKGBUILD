# Maintainer: xerneas3318 <184197860+xerneas3318@users.noreply.github.com>

pkgname=hackfetch-bin
pkgver=1.10.0
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
sha256sums_x86_64=('f1389bab87c92483df6d8d030d8baf199aef2bbf2d387285df962ebcd4b67dd4')
sha256sums_aarch64=('b3593256bd773edaadcd9814699202862e221cc8ad4deeb2d188774e27f73224')

package() {
    install -Dm755 "${srcdir}/hackfetch" "${pkgdir}/usr/bin/hackfetch"
}
