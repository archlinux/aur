# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('7e36508fe39265911eddafa9869e8b33da0353581fadf6a865688d6a5f659306')
sha256sums_aarch64=('9eb4d9eea01411a55c960eb2e603b557dfc854b527d95fb2d9b5e084ad32a845')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
