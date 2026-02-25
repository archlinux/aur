# Maintainer: Codespace <hello@codespace.sh>
pkgname=codewire-bin
pkgver=0.2.29
pkgrel=1
pkgdesc="Persistent process server for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://codewire.sh"
license=('MIT')
provides=('codewire')
conflicts=('codewire')
source_x86_64=("https://github.com/codespacesh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-x86_64-unknown-linux-musl")
source_aarch64=("https://github.com/codespacesh/codewire/releases/download/v${pkgver}/cw-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('d8a78898467d498fed3a096fe4aa2f65cd3c2b78050c8d2f2a9a638f2a8dcda9')
sha256sums_aarch64=('ef9e84f4fb56888767e162c05493b074911468cb3535315600e788917c9e0cfc')

package() {
  install -Dm755 "cw-v${pkgver}-"* "${pkgdir}/usr/local/bin/cw"
}
