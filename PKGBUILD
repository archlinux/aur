# Maintainer: Felinae Tang <me@felinae98.cn>
pkgname=cc-switch-cli-bin
pkgver=5.9.2
pkgrel=2
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('f48dc29a5098a0627a25d4450a949c077a487b2b066369a1c4ae6ef5e8985e61')
sha256sums_aarch64=('8a77c75284286a841ea288cfe7a45e3104a4678d77fc9a457e465d3529dc6fb7')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
