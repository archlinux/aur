# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.3.3::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.3.3/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.3.3::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.3/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.3.3::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.3/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('f4b3a73254de84e0bcc62eac46552828c253e4ce2d2e29921cdee99eff332214')
sha256sums_aarch64=('ba7ec2740fcf8dee6eaeb0d7f52be99c163c183fb9aea22c60fee73f6e65ac90')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.3.3" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.3.3" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
