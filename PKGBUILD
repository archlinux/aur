# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.4.0::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.4.0/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.4.0::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.4.0/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.4.0::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.4.0/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('99faba17f1e6ae72f8e2d7137575172fec4015e643134892411200571290bc09')
sha256sums_aarch64=('0229c2ada015abf2a55cbb59513a93b6be47840acfd84001bca81b3c780978b4')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.4.0" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.4.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
