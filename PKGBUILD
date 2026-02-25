# Maintainer: Codespace <hello@codespace.sh>
pkgname=codewire-bin
pkgver=0.2.34
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codespacesh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codespacesh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('71f63bf2035122501bc2c0dadbb464ed2fa09f1f83bf5261c96c4da100bb579e')
sha256sums_aarch64=('77fbc7ab0f4d4d0c84c591caa3d51101694ccd169f36cae28958e6fc811358a4')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
