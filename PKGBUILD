# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.2.58
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('03702c52d55644505afcff192db0b4177c234bdf83f9729b5e6e81a257d09c48')
sha256sums_aarch64=('ce8153017c76be1528e88fa453ad0cc55120987836722a74d60cdd6d2933c751')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
