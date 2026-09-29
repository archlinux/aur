# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Native V binary from GitHub Releases (canonical). Not a Python wheel.
pkgname=agent-toolkit-bin
pkgver=1.35.0
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
sha256sums_x86_64=('604f3132c22407461586d91e40e3a15194b7c90bad275cef8c0a21f21d67e6f7')
sha256sums_aarch64=('aaae5e206caba5e0296f809c2679896b7df87267c0e03555d02e4a22ebdb6e6b')

package() {
    install -Dm755 "${srcdir}/agent-toolkit" "${pkgdir}/usr/bin/agent-toolkit"
}
