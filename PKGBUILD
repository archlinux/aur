# Maintainer: Nicholas Bester <1872093+nicholasbester@users.noreply.github.com>
pkgname=clickup-cli-bin
_pkgname=clickup-cli
pkgver=0.12.1
pkgrel=1
pkgdesc="A CLI for the ClickUp API, optimized for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicholasbester/clickup-cli"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-arm64.tar.gz")
sha256sums_x86_64=('11024d5330f596defd8dc00cd2e70eff10b2750d7c657f42a2376ab11b2460bc')
sha256sums_aarch64=('e31a3f82b1a34fbcd83fbdc2a4b90a3e20f78a352f49ce04eb41f50bd9f37237')

package() {
  install -Dm755 "${srcdir}/clickup-cli" "${pkgdir}/usr/bin/clickup-cli"
  install -Dm755 "${srcdir}/clkup" "${pkgdir}/usr/bin/clkup"
}
