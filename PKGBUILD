# Maintainer: Nicholas Bester <1872093+nicholasbester@users.noreply.github.com>
pkgname=clickup-cli-bin
_pkgname=clickup-cli
pkgver=0.11.0
pkgrel=1
pkgdesc="A CLI for the ClickUp API, optimized for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicholasbester/clickup-cli"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-arm64.tar.gz")
sha256sums_x86_64=('2e840e804985a2318fa61f4706b5300f9703abca9d01a53a4e8d9b989e675a9e')
sha256sums_aarch64=('89ed4ed8f3ab182bebdb62f13afd9dbb58dc342da46329900b750acfa5c319b9')

package() {
  install -Dm755 "${srcdir}/clickup-cli" "${pkgdir}/usr/bin/clickup-cli"
  install -Dm755 "${srcdir}/clkup" "${pkgdir}/usr/bin/clkup"
}
