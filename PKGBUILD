# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.2.51
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('19848e04f2191bae9030999d74db2b2ad2449125dc28417435a39eb56825bd16')
sha256sums_aarch64=('81422f22e0402e3b4efa25fc7e83e84cc38d0339584a13fb3dde28a808ceb856')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
