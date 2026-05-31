# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.5.0::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.5.0/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.5.0::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.5.0/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.5.0::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.5.0/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('36c92af8d52c1c1ae7bfb037e72e1108212c65cac5305f38b8828bfb2f62f85b')
sha256sums_aarch64=('72a268ba2927bc8d76adeaed8771ec63d7edcb8edb573b746c21024f19f1db3f')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.5.0" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.5.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
