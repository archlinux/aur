# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-cli
pkgver=5.3.1
pkgrel=1
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli-bin')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-x64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-arm64-musl.tar.gz")
sha256sums_x86_64=('f1cd5ba5c03e369438951e11d11dc108a4c4f89269316c651d004eb0beca9331')
sha256sums_aarch64=('c4ea0e88f510f4ecac2180a8bd0eeaef65362b4e02262c13dbccc87240023f12')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
