# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.3.30
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/cli/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/cli/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('f5472155043193a67710a7f55c496665cb82feafcc466a4090afd23b2c422f17')
sha256sums_aarch64=('f2b9f6caf0d7203addc788f968e71e40bac7ae92ad6d4d2a58657a7b99f8f083')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
