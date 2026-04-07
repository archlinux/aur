# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('2a88fa3145ed073491824c5f31e731eb1013e4246ecf48b3e169947bf2ac087e')
sha256sums_aarch64=('51fb23d31994ee2363ae751c76933d424b6e5ef0a2bd6fb1a5a34df4a2bf39e5')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
