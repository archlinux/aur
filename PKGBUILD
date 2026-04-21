# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.3.25
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('4d4e35d14bd1c5c65e44c4724842be8dd212d1f39c1ab317d12cf1462c349b7b')
sha256sums_aarch64=('15af6e776e3bb0553fc017fbada4444c6aabe18559d0f57a9621431b259527f6')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
