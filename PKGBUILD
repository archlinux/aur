# Maintainer: Nicholas Bester <nick@odinside.tech>
pkgname=clickup-cli-bin
_pkgname=clickup-cli
pkgver=0.8.2
pkgrel=1
pkgdesc="A CLI for the ClickUp API, optimized for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicholasbester/clickup-cli"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-arm64.tar.gz")
sha256sums_x86_64=('3297cd3d2bd4da72c37bc96286d4dc9331cbc8d27a787940776f135b0b71f44e')
sha256sums_aarch64=('24249db2d473e7ab98d88c7d5f207f727d8bae35b407191eefff930b667365fe')

package() {
  install -Dm755 "${srcdir}/clickup" "${pkgdir}/usr/bin/clickup"
}
