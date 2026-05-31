# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.3.8::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.3.8/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.3.8::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.8/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.3.8::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.8/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('cfb1974b26bfdd037bd0cbac2839a65b427d9061f6b8ace05d49f95e8069e9e8')
sha256sums_aarch64=('77fb574929cc0e0621fc39174841ba778721db005ff5f4abe141fdae2f67a450')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.3.8" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.3.8" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
