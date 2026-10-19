# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Native V binary from GitHub Releases (canonical). Not a Python wheel.
pkgname=agent-toolkit-bin
pkgver=1.47.0
pkgrel=1
pkgdesc="Composable AI agent toolkit — native V CLI (prebuilt GitHub Release binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/ulises-jeremias/agent-toolkit"
license=('MIT')
provides=('agent-toolkit')
conflicts=('agent-toolkit')
options=('!strip')
source_x86_64=("agent-toolkit::https://github.com/ulises-jeremias/agent-toolkit/releases/download/v${pkgver}/agent-toolkit-linux-x86_64")
source_aarch64=("agent-toolkit::https://github.com/ulises-jeremias/agent-toolkit/releases/download/v${pkgver}/agent-toolkit-linux-arm64")
sha256sums_x86_64=('46f7d8b60bae03ee39c6d2a1d283cabd6f019d6077b82a9ad7cae890dc93b183')
sha256sums_aarch64=('442870d2a6008d2cca3fed88481ca0790fd1e37a54981aeed7339c7cce34a54b')

package() {
    install -Dm755 "${srcdir}/agent-toolkit" "${pkgdir}/usr/bin/agent-toolkit"
}
