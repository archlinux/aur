# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=sonic-bridge-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="An ultra-fast, lightweight physical music aesthetic and listening translation middleware for AI Agents under the LRMD protocol. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/sonic-bridge"
license=('MIT')
provides=('sonic-bridge')
conflicts=('sonic-bridge')
source=("LICENSE-0.7.0::https://raw.githubusercontent.com/Xuepoo/sonic-bridge/v0.7.0/LICENSE")
source_x86_64=("sonic-bridge-linux-x86_64-0.7.0::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.7.0/sonic-bridge-linux-x86_64")
source_aarch64=("sonic-bridge-linux-aarch64-0.7.0::https://github.com/Xuepoo/sonic-bridge/releases/download/v0.7.0/sonic-bridge-linux-aarch64")
sha256sums=('a0609908bbcd4b5a91e8e2ce9e302a7adfc57957d16ad3ef5ef532839e186243')
sha256sums_x86_64=('28cbc5e1dcb6869ce8d52ec38c8fd9815a0cde8bdc62cddad1b77cbac2f840ff')
sha256sums_aarch64=('b526dbcdf9933d0cf3a687844acdf125b277ac70e55ced9667b47d410e50b02c')

package() {
  install -Dm755 "$srcdir/sonic-bridge-linux-$CARCH-0.7.0" "$pkgdir/usr/bin/sonic-bridge"
  install -Dm644 "$srcdir/LICENSE-0.7.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
