# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Native V binary from GitHub Releases (canonical). Not a Python wheel.
pkgname=agent-toolkit-bin
pkgver=1.16.0
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
sha256sums_x86_64=('c19a47ca4763b127682d3461442e1fdcbe2a1d5cf58761302f4a49787eb7426a')
sha256sums_aarch64=('9470f48a476337cfc22960cf1018644cc1b978fff3385b80e4f2487a8a0c5bee')

package() {
    install -Dm755 "${srcdir}/agent-toolkit" "${pkgdir}/usr/bin/agent-toolkit"
}
