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
sha256sums_x86_64=('6e5f444ecbaa631e9de4ab543eed76265d8b2b943b29f84dfbe6dc19422a85dc')
sha256sums_aarch64=('a71126ede915e3f7ef6375692ce590c749ed6338e72becec13f69b7b453de91d')

package() {
    install -Dm755 "${srcdir}/hackfetch" "${pkgdir}/usr/bin/hackfetch"
}
