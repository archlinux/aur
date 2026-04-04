# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.2.100
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('41e68f81f3747f4665feddb53fe337c69da87cb3122770533cb2733309d8b0b5')
sha256sums_aarch64=('195794bee4804c751a7771b26b1209333b5341c1a88820cdb4c6ca87bb81fa5d')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
