# Maintainer: Codespace <hello@codespace.sh>
pkgname=codewire-bin
pkgver=0.2.35
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codespacesh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codespacesh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('997023e90cdb3e8125832a4d5df2357c808f511b042ba61bc7cc3fc3be73d40e')
sha256sums_aarch64=('689bc8c203501f76db5285315973a6cac4667120b0d2eeb57415548cfc641b9b')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
