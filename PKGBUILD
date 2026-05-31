# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.3.7::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.3.7/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.3.7::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.7/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.3.7::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.3.7/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('079977896f9f997e5ba905e2b0495fed8de14b6ffbc63367c568d42a7defee91')
sha256sums_aarch64=('150f629bd7bf2cb1f8e22e21360c6946123fedff16f5d84658f9581261f4869f')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.3.7" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.3.7" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
