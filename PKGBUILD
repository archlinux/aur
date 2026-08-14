# Maintainer: Nicholas Bester <1872093+nicholasbester@users.noreply.github.com>
pkgname=clickup-cli-bin
_pkgname=clickup-cli
pkgver=0.15.5
pkgrel=1
pkgdesc="A CLI for the ClickUp API, optimized for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicholasbester/clickup-cli"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-arm64.tar.gz")
sha256sums_x86_64=('09f9c7174d052f6755f00426d0f8494b30824e19d04bfdc4656fa9f65feba9a0')
sha256sums_aarch64=('40ccea627c9fac007a35b9bfd5c55f966ee4dc9138af72856103a96bf24efcb2')

package() {
  install -Dm755 "${srcdir}/clickup-cli" "${pkgdir}/usr/bin/clickup-cli"
  install -Dm755 "${srcdir}/clkup" "${pkgdir}/usr/bin/clkup"
}
