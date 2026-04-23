# Maintainer: Nicholas Bester <1872093+nicholasbester@users.noreply.github.com>
pkgname=clickup-cli-bin
_pkgname=clickup-cli
pkgver=0.9.1
pkgrel=1
pkgdesc="A CLI for the ClickUp API, optimized for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicholasbester/clickup-cli"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nicholasbester/clickup-cli/releases/download/v${pkgver}/clickup-linux-arm64.tar.gz")
sha256sums_x86_64=('06903d9880bdec2d9a9a682915da124554273d70cea131ed2e60c772937f3117')
sha256sums_aarch64=('33ad78d6115f8ddbef4cd76a51bb687ba63ca4a12ff00f404587e5672b260ae3')

package() {
  install -Dm755 "${srcdir}/clickup" "${pkgdir}/usr/bin/clickup"
}
