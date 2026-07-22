# Maintainer: xerneas3318 <184197860+xerneas3318@users.noreply.github.com>

pkgname=hackfetch-bin
pkgver=2.0.1
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
sha256sums_x86_64=('807949460a4647622c77d09cc08bf2cb4bfd13ad6594906b537fac3ab96b9308')
sha256sums_aarch64=('7fdb1d46a64bc88a804e430067365d9a594823895a2f4b08c62329429775a93c')

package() {
    install -Dm755 "${srcdir}/hackfetch" "${pkgdir}/usr/bin/hackfetch"
}
