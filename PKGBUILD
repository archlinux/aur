# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Native V binary from GitHub Releases (canonical). Not a Python wheel.
pkgname=agent-toolkit-bin
pkgver=1.45.0
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
sha256sums_x86_64=('0fb58da3cb3ed7071dc168d943f6b81a0ff747573bdad0c6ab507252e5eafa35')
sha256sums_aarch64=('9879bc3db61dd6bc44b4ed1ae7825cc094a8014dcb383d0126b1a425df4f72a2')

package() {
    install -Dm755 "${srcdir}/agent-toolkit" "${pkgdir}/usr/bin/agent-toolkit"
}
