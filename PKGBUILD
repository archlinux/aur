# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.3.4::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.3.4/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.3.4::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.4/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.3.4::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.4/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('af18ae9b03e0b46771f2c69425bddf9153333d33eedc2312a6c111aab2f33322')
sha256sums_aarch64=('c42585c5667e4eb40a197007a4b37f160eaabd0eed1a6f1cf070ec40277903b0')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.3.4" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.3.4" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
