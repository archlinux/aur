# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('0c54f501d39b436c5d5c5e11fce7471dd93143d33a9185c8825989793b93048b')
sha256sums_aarch64=('397175769780d6cdf27177340c6e2ad494c3222fa029a77ba6f571f3d00ebfd5')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
