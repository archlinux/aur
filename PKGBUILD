# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.6.0::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.6.0/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.6.0::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.6.0/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.6.0::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.6.0/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('47286658ebfa1a91e93ef53e0b12bb8dd8cf6d3fe2f1d27be4f33700796bbeb5')
sha256sums_aarch64=('99871d96e2d7517d5cb89070cbf0f3f9ea9511c2836d8c0972eb0b178262492b')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.6.0" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.6.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
