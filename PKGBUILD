# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-cli
pkgver=5.9.3
pkgrel=1
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli-bin')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-x64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-linux-arm64-musl.tar.gz")
sha256sums_x86_64=('a581ec26efda795182949243665ea725d42029c58bb4b9137d0708b255a4fb91')
sha256sums_aarch64=('b733f613b32bbb37af3fedd4703c3431da12d346e94bc55af791b134545ebd07')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
