# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-cli
pkgver=5.8.4
pkgrel=1
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli-bin')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-x64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-arm64-musl.tar.gz")
sha256sums_x86_64=('10755ee5656995aa83becaefc541b4ceeff8900cba02250a5b00cdcbf0f01ce8')
sha256sums_aarch64=('d5afd5200bb69047b1a9964d582b3ec69d32aae38f8c6fd2e69bc30c4df38953')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
