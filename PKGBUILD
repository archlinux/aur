# Maintainer: Felinae Tang <me@felinae98.cn>
pkgname=cc-switch-cli-bin
pkgver=5.6.1
pkgrel=1
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('eb2d5651a27ecbefd0b738d5b216e462e23a43fda569417271197d008b497083')
sha256sums_aarch64=('eb2d5651a27ecbefd0b738d5b216e462e23a43fda569417271197d008b497083')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
