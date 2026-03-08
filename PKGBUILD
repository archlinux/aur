# Maintainer: Codewire <hello@codewire.sh>
pkgname=codewire-bin
pkgver=0.2.57
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codewiresh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('7346122cf43c36a311de9c162c6325e43730a59b64b86789da6abcde1ee12cd5')
sha256sums_aarch64=('8a699a3f3185ed9b14fd292cca78e794b743ca782edd4a7e3ae614876e8d8b07')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
