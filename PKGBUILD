# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.3.6::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.3.6/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.3.6::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.6/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.3.6::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.6/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('591c34aba9b987426ae382c6b790c07954fa1a6ab9c10cbc3c81712392ae2266')
sha256sums_aarch64=('56aa730bc50b46b1cdea97151c01d4eda9b02c3bfb2532106eb55c2d520675b3')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.3.6" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.3.6" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
