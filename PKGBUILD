pkgname=sonic-bridge-bin
pkgver=0.3.1
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
sha256sums_x86_64=('2e556175ddbf7bfe50aead11d6d8db032f9a9aa5fe6d9b6fb015635ff57273de')
sha256sums_aarch64=('b445d8c2be248843b7680641cf873f1182e9975882e611d8934193c711cb6b94')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
