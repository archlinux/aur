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
sha256sums_x86_64=('9486ae7fba173cc8ed7825cafd75130ed928f5695a1a405db9adfd96c9d4212d')
sha256sums_aarch64=('55e6818716ebcfac8de5bd2952613a04e10370ac38e8def7205fb7eef713f59f')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.4.2" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.4.2" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
