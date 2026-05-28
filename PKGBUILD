# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-cli
pkgver=5.7.0
pkgrel=1
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli-bin')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-x64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-arm64-musl.tar.gz")
sha256sums_x86_64=('2131c2e49896f97872bbada056f9546d291a6a3c57733689ee40e5738d2df413')
sha256sums_aarch64=('8dd1ca3c56c2b44a858c6ad94e50a46af331b90e88ee2dbf0ce1ea082ddc905e')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
