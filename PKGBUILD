# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('fa16e71065312f6de5a579543d6b761f6c3afd20ea73a3b2dc84195f174d0e79')
sha256sums_aarch64=('ba2733a27d1ffb2effb656b302a492308471761f232a216196bea018d47d9b4d')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
