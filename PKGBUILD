# Maintainer: Nicholas Bester <1872093+nicholasbester@users.noreply.github.com>
pkgname=clickup-cli-bin
_pkgname=clickup-cli
pkgver=0.15.4
pkgrel=1
pkgdesc="A CLI for the ClickUp API, optimized for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicholasbester/clickup-cli"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-arm64.tar.gz")
sha256sums_x86_64=('1378134d5435a41d49dfe70b7cdd71869ab63fbc02c97e9a69c5f79558a2108c')
sha256sums_aarch64=('67e4989f735a34aa56769300271b485304c5ce6be7731c310582b34be1370ed3')

package() {
  install -Dm755 "${srcdir}/clickup-cli" "${pkgdir}/usr/bin/clickup-cli"
  install -Dm755 "${srcdir}/clkup" "${pkgdir}/usr/bin/clkup"
}
