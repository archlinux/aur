# Maintainer: Nicholas Bester <1872093+nicholasbester@users.noreply.github.com>
pkgname=clickup-cli-bin
_pkgname=clickup-cli
pkgver=0.14.0
pkgrel=1
pkgdesc="A CLI for the ClickUp API, optimized for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicholasbester/clickup-cli"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-arm64.tar.gz")
sha256sums_x86_64=('82c0c06c25162f24a977da2415c1bb09be717eaa9a70c86f58b31195a58ebb69')
sha256sums_aarch64=('1e475c1176197dac4164118051c76087a58a03cd2817a1d232ccf86f4c6ed910')

package() {
  install -Dm755 "${srcdir}/clickup-cli" "${pkgdir}/usr/bin/clickup-cli"
  install -Dm755 "${srcdir}/clkup" "${pkgdir}/usr/bin/clkup"
}
