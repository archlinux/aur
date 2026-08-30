# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-cli
pkgver=5.10.4
pkgrel=1
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli-bin')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-x64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-arm64-musl.tar.gz")
sha256sums_x86_64=('a9a569d85cb0a61169082a558f86786e0e7ee9c2725900e7d6e876873eb416c3')
sha256sums_aarch64=('37d9b2564f9d47215dbb45914158d71f746d92d829ad62ca1214de4eeb5bfc6f')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
