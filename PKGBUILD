# Maintainer: Felinae Tang <me@felinae98.cn>
pkgname=cc-switch-cli-bin
pkgver=5.8.5
pkgrel=2
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('ab7b55322bf0cbf38d2ee4c66449e34ab62d99797d3a66dc098a2b3f411cbba8')
sha256sums_aarch64=('16e5147828dc9607c2e80d038f43992cfbc2e2f046c00f7a7ac42975d11bdf4d')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
