# Maintainer: Felinae Tang <me@felinae98.cn>
pkgname=cc-switch-cli-bin
pkgver=5.8.4
pkgrel=2
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('bb7fba794c7d5ad639056636f427f29ffea28df3b91b415f57e7a46af4ee1627')
sha256sums_aarch64=('87c1027dafefab944b4c39f3d81314f36c4db3696433e15a7582865fc1d802cb')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
