# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.4.1::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.4.1/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.4.1::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.4.1/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.4.1::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.4.1/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('9ab642aa1bdb7af8cbd3325db9c21474487b12c03f6b8b7844aecfc94e3e8f21')
sha256sums_aarch64=('d917c1bf345456d0e9a6865a0e833cb7b78339fdb8bfcadb7811ad71da03d0de')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.4.1" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.4.1" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
