# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switch-cli
pkgver=5.2.1
pkgrel=2
pkgdesc="Cross-platform CLI All-in-One assistant tool for Claude Code, Codex & Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli-bin')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v5.2.1/cc-switch-cli-linux-x64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v5.2.1/cc-switch-cli-linux-arm64-musl.tar.gz")
sha256sums_x86_64=('6f770773cff794e9f341c8a7f69003e19152c3ff4184e7b5b6ff31c07197d359')
sha256sums_aarch64=('237d03f5a179da848e29c72cb9e0be8974ba04e25076bf5985ecac64d85ee415')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
}
