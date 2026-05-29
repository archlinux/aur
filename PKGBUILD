pkgname=sonic-bridge-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v$pkgver/LICENSE")
source_x86_64=("https://github.com/Xuepoo/sonic-bridge/releases/download/v$pkgver/sonic-bridge-linux-x86_64")
source_aarch64=("https://github.com/Xuepoo/sonic-bridge/releases/download/v$pkgver/sonic-bridge-linux-aarch64")

sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('800a0302cd2b9c092c899a961d59eeca53d8298a7791220e36b4f30f09caa68e')
sha256sums_aarch64=('633bddacf50f1a42c39e183e6b4582d59632e1e364dd607e251231510dde015a')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
