# Maintainer: Nicholas Bester <1872093+nicholasbester@users.noreply.github.com>
pkgname=clickup-cli-bin
_pkgname=clickup-cli
pkgver=0.10.0
pkgrel=1
pkgdesc="A CLI for the ClickUp API, optimized for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicholasbester/clickup-cli"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-arm64.tar.gz")
sha256sums_x86_64=('ab536601ebcf7e801fa243e76d542e9b38533de32e40e31975b9ed16fc87f1b1')
sha256sums_aarch64=('026223f8df10cf363ccada7540bbbe0678b07789d4c8d9004112dda6d75d24b3')

package() {
  install -Dm755 "${srcdir}/clickup" "${pkgdir}/usr/bin/clickup"
}
