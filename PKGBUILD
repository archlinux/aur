# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Native V binary from GitHub Releases (canonical). Not a Python wheel.
pkgname=agent-toolkit-bin
pkgver=1.19.0
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
sha256sums_x86_64=('88ac64c1d83d724023019942cf3d629a503afac575c3e9917e43abf855c70f39')
sha256sums_aarch64=('b6b00f3dce2cb55b48ffa4407534af76fa579bedf223fa884fc3806971fcd470')

package() {
    install -Dm755 "${srcdir}/agent-toolkit" "${pkgdir}/usr/bin/agent-toolkit"
}
