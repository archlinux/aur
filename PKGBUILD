# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.2.55
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('3c07a11d0de90b793b082fe17794f4f5c232af05fc271386e69850638bf95652')
sha256sums_aarch64=('7e688246bc95e0f9ead8e66d6ea4ebd84dfe6e062eeec667a1691f0382d82280')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
