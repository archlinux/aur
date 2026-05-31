# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.4.2::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.4.2/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.4.2::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.4.2/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.4.2::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.4.2/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('9895fb6427bebc5adc846b5cc9da15f2bdddb8db732b387e04fb0fe0d47cb0d3')
sha256sums_aarch64=('d84f0ef16a43ceaae10905a5885d60d17473334e71ee21f7301cb8b923585a21')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.4.2" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.4.2" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
