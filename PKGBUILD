# Maintainer: Felinae Tang <me@felinae98.cn>
pkgname=cc-switch-cli-bin
pkgver=5.10.4
pkgrel=2
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('9e332d987f7e516b4cfe1a78ca10007705effc705b2b0545b8672a0e71b769e1')
sha256sums_aarch64=('f88188699aa0bc73346795b3e8ad742b754dafe246e54d2d092df1ed951706e3')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
